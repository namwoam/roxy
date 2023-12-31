/*******************************************************************************
 *
 *  File Name    :  core.c
 *
 *  Purpose      :  Implementation of roxy system functionality
 *
 *  References   :  None
 *
 *  Design Notes :  None
 *
 *  Author       :  An-Che Liang
 *
 *  Project      :  Platfrom Migration Experiment
 *
 *  Target       :  Raspberry Pi 3B / Linux
 *
 *  Modification History:
 *                  Baseline, 2023-08
 *
 *******************************************************************************/
#include "core.h"

#define MAX_SEARCH_ITERATION 100

static struct roxy_task roxy_tasks[ROXY_TASK_COUNT];
static struct roxy_thread roxy_threads[ROXY_THREAD_COUNT];
static pthread_mutex_t roxy_critical_sections[ROXY_CRITICAL_SECTION_COUNT];
static struct roxy_mqueue roxy_mqueues[ROXY_MQUEUE_COUNT];
static struct roxy_event roxy_events[ROXY_EVENT_COUNT];
static void *roxy_interrupts[ROXY_INTERRUPT_COUNT];
/*
abandom event signal implementation
void roxy_signal_handler(int signal_vector)
{
    printf("Get signal:%d\n", signal_vector);
    roxy_critical_section_enter(ROXY_SYSTEM_CRITICAL_SECTION_ID);
    roxy_event_gates[signal_vector - ROXY_EVENT_SIGDISPLACEMENT] = 0;
    roxy_critical_section_leave(ROXY_SYSTEM_CRITICAL_SECTION_ID);
    return;
}
*/

enum roxy_status_code
roxy_init()
{
    // must single thread!!
    // init random generator
    srand(ROXY_RANDOM_SEED);
    // init tasks and threads
    for (int i = 0; i < ROXY_TASK_COUNT; i++)
    {
        struct roxy_task default_task = {TASK_EMPTY, ROXY_TASK_PREINIT_PRIORITY, NULL, NULL, NULL, NULL, {[0 ... ROXY_TASK_THREAD_LIMIT - 1] = ROXY_TASK_PREINIT_THREADID}};
        roxy_tasks[i] = default_task;
    }

    for (int i = 0; i < ROXY_THREAD_COUNT; i++)
    {
        roxy_threads[i].status = THREAD_EMPTY;
        roxy_threads[i].os_thread_id = ROXY_THREAD_PREINIT_OS_THREADID;
    }
    for (int i = 0; i < ROXY_CRITICAL_SECTION_COUNT; i++)
    {
        pthread_mutex_init(&roxy_critical_sections[i], NULL);
    }
    for (int i = 0; i < ROXY_MQUEUE_COUNT; i++)
    {
        strcpy(roxy_mqueues[i].channel_name, "");
    }
    /*
    abandom event signal implementation

    printf("ROXY-SYSTEM: maximum signal id:%d\n", SIGRTMAX);
    if (ROXY_EVENT_SIGDISPLACEMENT + ROXY_EVENT_COUNT >= SIGRTMAX)
    {
        if (ROXY_DEBUG)
        {
            printf("Roxy-DEBUG: Invalid event count, check SIGRTMAX of system kernel.");
        }
        return CONFIG_ERROR;
    }
    struct sigaction signal_action;
    signal_action.sa_handler = &roxy_signal_handler;
    sigfillset(&signal_action.sa_mask);
    signal_action.sa_flags = SA_RESTART;
    int ret;
    for (int event_id = 0; event_id < ROXY_EVENT_COUNT; event_id++)
    {
        ret = sigaction(event_id + ROXY_EVENT_SIGDISPLACEMENT, &signal_action, NULL);
        if (ret)
        {
            if (ROXY_DEBUG)
            {
                printf("ROXY-DEBUG: Error setting up signal handler at event_id=%d\n", event_id);
            }
            return CONFIG_ERROR;
        }
    }
    */
    for (int event_id = 0; event_id < ROXY_EVENT_COUNT; event_id++)
    {
        pthread_mutex_init(&roxy_events[event_id].protect_mutex, NULL);
        pthread_cond_init(&roxy_events[event_id].waiting_condition, NULL);
        roxy_events[event_id].gate = ROXY_EVENT_GATEOPEN;
    }
    for (int interrupt_id = 0; interrupt_id < ROXY_INTERRUPT_COUNT; interrupt_id++)
    {
        roxy_interrupts[interrupt_id] = NULL;
    }
    // check config
    const int os_priority_level = sched_get_priority_max(ROXY_SCHEDULE_POLICY) - sched_get_priority_min(ROXY_SCHEDULE_POLICY);
    if (ROXY_DEBUG)
    {
        printf("ROXY-DEBUG: Priority provided by the os: %d\n", os_priority_level);
        printf("ROXY-DEBUG: Priority defined by roxy: %d\n", ROXY_PRIORITY_LEVEL_COUNT);
    }
    if (os_priority_level < ROXY_PRIORITY_LEVEL_COUNT)
    {
        return CONFIG_ERROR;
    }
    return SUCCESS;
}

enum roxy_status_code roxy_clean()
{
    int ret;
    for (int mqueue_id = 0; mqueue_id < ROXY_MQUEUE_COUNT; mqueue_id++)
    {
        if (strcmp(roxy_mqueues[mqueue_id].channel_name, "") != 0)
        {
            ret = mq_unlink(roxy_mqueues[mqueue_id].channel_name);
            if (ret)
            {
                if (ROXY_DEBUG)
                {
                    printf("ROXY-DEBUG: Failed to unlink the mqueue (mqueue_id=%d , channel_name=%s) error_code=%d\n", mqueue_id, roxy_mqueues[mqueue_id].channel_name, ret);
                }
                return RUNTIME_ERROR;
            }
            if (ROXY_DEBUG)
            {
                printf("ROXY-SYSTEM: Successfully unlink mqueue (mqueue_id=%d , channel_name=%s)\n", mqueue_id, roxy_mqueues[mqueue_id].channel_name);
            }
            strcpy(roxy_mqueues[mqueue_id].channel_name, "");
        }
    }
}

enum roxy_status_code roxy_task_create(unsigned task_id, unsigned priority, void *constructor_ptr, void *function_ptr, void *deconstructor_ptr, void *argument_ptr)
{
    if (task_id < ROXY_TASK_COUNT && roxy_tasks[task_id].status == TASK_EMPTY)
    {
        // means this task haven't been created
        roxy_tasks[task_id].status = TASK_LOADED;
        roxy_tasks[task_id].priority = priority;
        roxy_tasks[task_id].constructor_pointer = constructor_ptr;
        roxy_tasks[task_id].function_pointer = function_ptr;
        roxy_tasks[task_id].deconstructor_pointer = deconstructor_ptr;
        roxy_tasks[task_id].argument_pointer = argument_ptr;
        return SUCCESS;
    }
    if (ROXY_DEBUG)
    {
        printf("ROXY-DEBUG: task_id out-of-bound or task already existed\n");
    }
    return RUNTIME_ERROR;
}

void *roxy_thread_runner(void *data)
{
    struct thread_arg *args = (struct thread_arg *)data;
    void (*task_function)();
    void (*constructor)();
    void (*deconstructor)();
    roxy_threads[args->thread_id].os_thread_id = gettid();
    if (ROXY_DEBUG)
    {
        printf("ROXY-SYSTEM: thread_id:%d pthread_id:%lu running on os thread:%d\n", args->thread_id, roxy_threads[args->thread_id].posix_thread_id, roxy_threads[args->thread_id].os_thread_id);
    }
    if (roxy_tasks[args->task_id].constructor_pointer != NULL)
    {
        constructor = roxy_tasks[args->task_id].constructor_pointer;
        constructor();
    }
    if (roxy_tasks[args->task_id].function_pointer != NULL)
    {
        task_function = roxy_tasks[args->task_id].function_pointer;
        task_function();
    }
    if (roxy_tasks[args->task_id].deconstructor_pointer != NULL)
    {
        deconstructor = roxy_tasks[args->task_id].deconstructor_pointer;
        deconstructor();
    }
    roxy_threads[args->thread_id].status = THREAD_TERMINATED;
    return NULL;
}

enum roxy_status_code roxy_task_start(unsigned task_id, unsigned thread_count)
{
    if (task_id > ROXY_TASK_COUNT || roxy_tasks[task_id].status == TASK_EMPTY || thread_count > ROXY_TASK_THREAD_LIMIT)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to start the task (task_id=%d)\n", task_id);
        }
        return RUNTIME_ERROR;
    }
    for (int i = 0; i < ROXY_TASK_THREAD_LIMIT; i++)
    {
        if (roxy_tasks[task_id].thread_ids[i] != ROXY_TASK_PREINIT_THREADID)
        {
            if (ROXY_DEBUG)
            {
                printf("ROXY-DEBUG: The task (task_id=%d) was already started\n", task_id);
            }
            return RUNTIME_ERROR;
        }
    }
    cpu_set_t cpuset;
    CPU_ZERO(&cpuset);
    for (size_t i = 0; i < ROXY_CPU_COUNT; i++)
    {
        CPU_SET(i, &cpuset);
    }

    for (unsigned thread_n = 0; thread_n < thread_count; thread_n++)
    {
        int ret;
        pthread_attr_t thread_attr;
        struct sched_param scheduler_param;
        /* Initialize pthread attributes (default values) */
        ret = pthread_attr_init(&thread_attr);
        if (ret)
        {
            if (ROXY_DEBUG)
            {
                printf("ROXY-DEBUG: init pthread attributes failed\n");
            }

            return RUNTIME_ERROR;
        }
        /* Set a specific stack size  */
        ret = pthread_attr_setstacksize(&thread_attr, ROXY_THREAD_STACK_SIZE);
        if (ret)
        {
            if (ROXY_DEBUG)
            {
                printf("ROXY-DEBUG: pthread setstacksize failed\n");
            }
            return RUNTIME_ERROR;
        }
        /* Set scheduler policy and priority of pthread */
        ret = pthread_attr_setschedpolicy(&thread_attr, ROXY_SCHEDULE_POLICY);
        if (ret)
        {
            if (ROXY_DEBUG)
            {
                printf("ROXY-DEBUG: pthread setschedpolicy failed\n");
            }
            return RUNTIME_ERROR;
        }
        scheduler_param.sched_priority = roxy_tasks[task_id].priority;
        ret = pthread_attr_setschedparam(&thread_attr, &scheduler_param);
        if (ret)
        {
            if (ROXY_DEBUG)
            {
                printf("ROXY-DEBUG: pthread setschedparam failed\n");
            }
            return RUNTIME_ERROR;
        }
        /* Use scheduling parameters of attr */
        ret = pthread_attr_setinheritsched(&thread_attr, PTHREAD_EXPLICIT_SCHED);
        if (ret)
        {
            if (ROXY_DEBUG)
            {
                printf("ROXY-DEBUG: pthread setinheritsched failed\n");
            }
            return RUNTIME_ERROR;
        }
        /* Create a pthread with specified attributes */
        int search_index;

        for (int i = 0; i < MAX_SEARCH_ITERATION; i++)
        {
            search_index = rand() % ROXY_THREAD_COUNT;
            if (roxy_threads[search_index].status == THREAD_EMPTY)
            {
                roxy_threads[search_index].status = THREAD_EXECUTING;
                roxy_threads[search_index].arg.task_id = task_id;
                roxy_threads[search_index].arg.thread_id = search_index;
                ret = pthread_create(&roxy_threads[search_index].posix_thread_id, &thread_attr, roxy_thread_runner, &roxy_threads[search_index].arg);
                if (ret)
                {
                    if (ROXY_DEBUG)
                    {
                        printf("ROXY-DEBUG: create compute pthread failed\n");
                    }
                    return RUNTIME_ERROR;
                }
                pthread_setaffinity_np(roxy_threads[search_index].posix_thread_id, sizeof(cpuset), &cpuset);
                roxy_tasks[task_id].thread_ids[thread_n] = search_index;
                break;
            }
        }
    }
    roxy_tasks[task_id].status = TASK_EXECUTING;
    return SUCCESS;
}

enum roxy_status_code roxy_task_suspend(unsigned task_id)
{
    // no need to implement yeah!
}
enum roxy_status_code roxy_task_wait(unsigned time_interval, unsigned wait_option)
{
    struct timespec req, rem;
    if (wait_option == ROXY_WAIT_NANOSECOND)
    {
        req.tv_nsec = time_interval;
        req.tv_sec = 0;
    }
    else if (wait_option == ROXY_WAIT_SECOND)
    {
        req.tv_nsec = 0;
        req.tv_sec = time_interval;
    }
    else
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Invalid wait option\n");
        }
        return RUNTIME_ERROR;
    }

    if (nanosleep(&req, &rem) == -1)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Error occurred during wait (might be integer overflow)\n");
        }
        return RUNTIME_ERROR;
    }
    return SUCCESS;
}

enum roxy_status_code roxy_task_set_priority(unsigned task_id, unsigned new_priority)
{
    if (task_id < 0 || task_id >= ROXY_TASK_COUNT || roxy_tasks[task_id].status == TASK_EMPTY)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to find the task (task_id=%d)\n", task_id);
        }
        return RUNTIME_ERROR;
    }
    if (roxy_tasks[task_id].status != TASK_LOADED)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Task must be in the loaded state to set priority, task_id=%d\n", task_id);
        }
        return RUNTIME_ERROR;
    }
    roxy_tasks[task_id].priority = new_priority;
    /*
    setpriority change NI value, which is irreverent in rt system.
    for (int thread_index = 0; thread_index < ROXY_TASK_THREAD_LIMIT; thread_index++)
    {
        int ret;
        if (roxy_tasks[task_id].thread_ids[thread_index] != ROXY_TASK_PREINIT_THREADID)
        {
            int priority = new_priority;
            ret = setpriority(PRIO_PROCESS, roxy_threads[roxy_tasks[task_id].thread_ids[thread_index]].os_thread_id, priority);
            if (ret)
            {
                if (ROXY_DEBUG)
                {
                    printf("ROXY-DEBUG: Failed to set the new priority: thread_id=%d, error_code=%d\n", roxy_threads[roxy_tasks[task_id].thread_ids[thread_index]].os_thread_id, ret);
                }
                return RUNTIME_ERROR;
            }
        }
    }
    */
}

enum roxy_status_code roxy_critical_section_enter(unsigned section_id)
{
    if (section_id >= ROXY_CRITICAL_SECTION_COUNT)
    {
        return RUNTIME_ERROR;
    }
    int ret = pthread_mutex_lock(&roxy_critical_sections[section_id]);
    if (ret)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to lock the critical section mutex (section_id=%d)\n", section_id);
        }
        return RUNTIME_ERROR;
    }
    return SUCCESS;
}

enum roxy_status_code roxy_critical_section_leave(unsigned section_id)
{
    if (section_id >= ROXY_CRITICAL_SECTION_COUNT)
    {
        return RUNTIME_ERROR;
    }
    int ret = pthread_mutex_unlock(&roxy_critical_sections[section_id]);
    if (ret)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to unlock the critical section mutex (section_id=%d)\n", section_id);
        }
        return RUNTIME_ERROR;
    }
    return SUCCESS;
}

enum roxy_status_code roxy_loop(unsigned task_id)
{
    if (task_id < 0 || task_id >= ROXY_TASK_COUNT || roxy_tasks[task_id].status == TASK_EMPTY)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to find the task (task_id=%d)\n", task_id);
        }
        return RUNTIME_ERROR;
    }
    for (int thread_index = 0; thread_index < ROXY_TASK_THREAD_LIMIT; thread_index++)
    {
        int ret;
        if (roxy_tasks[task_id].thread_ids[thread_index] != ROXY_TASK_PREINIT_THREADID)
        {
            ret = pthread_join(roxy_threads[roxy_tasks[task_id].thread_ids[thread_index]].posix_thread_id, NULL);
            if (ret)
            {
                if (ROXY_DEBUG)
                {
                    printf("ROXY-DEBUG: Failed to join the thread: thread_id=%lu, error_code=%d\n", roxy_threads[roxy_tasks[task_id].thread_ids[thread_index]].posix_thread_id, ret);
                }
                return RUNTIME_ERROR;
            }
        }
    }

    return SUCCESS;
}

enum roxy_status_code roxy_mqueue_create(unsigned mqueue_id, unsigned queue_capacity, unsigned message_maximum_length)
{
    if (mqueue_id < 0 || mqueue_id >= ROXY_MQUEUE_COUNT)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to start the message queue (mqueue_id=%d)\n", mqueue_id);
        }
        return RUNTIME_ERROR;
    }
    if (strcmp(roxy_mqueues[mqueue_id].channel_name, "") != 0)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: The message queue (mqueue_id=%d), has been initialized before\n", mqueue_id);
        }
        return RUNTIME_ERROR;
    }
    sprintf(roxy_mqueues[mqueue_id].channel_name, "/%x", mqueue_id);
    struct mq_attr mqueue_attr;
    mqueue_attr.mq_maxmsg = queue_capacity;
    mqueue_attr.mq_msgsize = message_maximum_length;
    mqueue_attr.mq_flags = 0;
    mqueue_attr.mq_curmsgs = -1;
    roxy_mqueues[mqueue_id].mqueue_attribute = mqueue_attr;
    mqd_t mqueue_descriptor;
    mqueue_descriptor = mq_open(roxy_mqueues[mqueue_id].channel_name, O_CREAT | O_CLOEXEC | O_EXCL, 0644, &mqueue_attr);
    if (((mqd_t)-1) == mqueue_descriptor)
    {
        if (ROXY_DEBUG)
        {
            extern int errno;
            printf("ROXY-DEBUG: Failed to create message queue (mqueue_id=%d, channel_name=%s), error_code=%d\n", mqueue_id, roxy_mqueues[mqueue_id].channel_name, errno);
        }
        return RUNTIME_ERROR;
    }
    int ret;
    ret = mq_close(mqueue_descriptor);
    if (ret)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to close message queue (mqueue_id=%d, channel_name=%s)\n", mqueue_id, roxy_mqueues[mqueue_id].channel_name);
        }
        return RUNTIME_ERROR;
    }
    return SUCCESS;
}

enum roxy_status_code roxy_mqueue_send(unsigned mqueue_id, const char *message_buffer, unsigned message_length)
{
    if (mqueue_id < 0 || mqueue_id >= ROXY_MQUEUE_COUNT || strcmp(roxy_mqueues[mqueue_id].channel_name, "") == 0)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: The message queue (mqueue_id=%d), has not been initialized before\n", mqueue_id);
        }
        return RUNTIME_ERROR;
    }
    mqd_t mqueue_descriptor;
    mqueue_descriptor = mq_open(roxy_mqueues[mqueue_id].channel_name, O_WRONLY | O_CLOEXEC);
    if (mqueue_descriptor == -1)
    {
        if (ROXY_DEBUG)
        {
            extern int errno;
            printf("ROXY-DEBUG: Failed to open message queue (mqueue_id=%d, channel_name=%s), error_code=%d\n", mqueue_id, roxy_mqueues[mqueue_id].channel_name, errno);
        }
        return RUNTIME_ERROR;
    }
    int ret;
    ret = mq_send(mqueue_descriptor, message_buffer, message_length, 0); // default message priority
    if (ret)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to transmit data on message queue (mqueue_id=%d, channel_name=%s) error_code=%d\n", mqueue_id, roxy_mqueues[mqueue_id].channel_name, ret);
        }
        return RUNTIME_ERROR;
    }
    ret = mq_close(mqueue_descriptor);
    if (ret)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to close message queue (mqueue_id=%d, channel_name=%s)\n", mqueue_id, roxy_mqueues[mqueue_id].channel_name);
        }
        return RUNTIME_ERROR;
    }
    return SUCCESS;
}

enum roxy_status_code roxy_mqueue_receive(unsigned mqueue_id, char *message_buffer, unsigned message_length, int blocking)
{
    if (mqueue_id < 0 || mqueue_id >= ROXY_MQUEUE_COUNT || strcmp(roxy_mqueues[mqueue_id].channel_name, "") == 0)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: The message queue (mqueue_id=%d), has not been initialized before\n", mqueue_id);
        }
        return RUNTIME_ERROR;
    }
    mqd_t mqueue_descriptor;
    if (blocking == ROXY_MQUEUE_BLOCKING)
    {
        mqueue_descriptor = mq_open(roxy_mqueues[mqueue_id].channel_name, O_RDONLY | O_CLOEXEC);
    }
    else if (blocking == ROXY_MQUEUE_NONBLOCKING)
    {
        mqueue_descriptor = mq_open(roxy_mqueues[mqueue_id].channel_name, O_RDONLY | O_NONBLOCK | O_CLOEXEC);
    }
    else
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Invalid blocking option at roxy_mqueue_receive\n");
        }
        return RUNTIME_ERROR;
    }
    if (mqueue_descriptor == -1)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to open message queue (mqueue_id=%d, channel_name=%s)\n", mqueue_id, roxy_mqueues[mqueue_id].channel_name);
        }
        return RUNTIME_ERROR;
    }
    int message_size;
    int ret;
    int error_code;
    message_size = mq_receive(mqueue_descriptor, message_buffer, message_length, &error_code); // default message priority
    if (message_size == -1)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to receive message from message queue (mqueue_id=%d, channel_name=%s) error_code=%d\n", mqueue_id, roxy_mqueues[mqueue_id].channel_name , error_code);
        }
        mq_close(mqueue_descriptor);
        return RUNTIME_ERROR;
    }
    ret = mq_close(mqueue_descriptor);
    if (ret)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to close message queue (mqueue_id=%d, channel_name=%s)\n", mqueue_id, roxy_mqueues[mqueue_id].channel_name);
        }
        return RUNTIME_ERROR;
    }
    return SUCCESS;
}

int roxy_mqueue_get_pending(unsigned mqueue_id)
{
    if (mqueue_id < 0 || mqueue_id >= ROXY_MQUEUE_COUNT || strcmp(roxy_mqueues[mqueue_id].channel_name, "") == 0)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: The message queue (mqueue_id=%d), has not been initialized before\n", mqueue_id);
        }
        return -1;
    }
    mqd_t mqueue_descriptor;
    mqueue_descriptor = mq_open(roxy_mqueues[mqueue_id].channel_name, O_RDONLY | O_CLOEXEC);
    if (mqueue_descriptor == -1)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to open message queue (mqueue_id=%d, channel_name=%s)\n", mqueue_id, roxy_mqueues[mqueue_id].channel_name);
        }
        return -1;
    }
    int ret;
    struct mq_attr mqueue_attr;
    ret = mq_getattr(mqueue_descriptor, &mqueue_attr);
    if (ret)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to obtain the attribute of message queue (mqueue_id=%d, channel_name=%s)\n", mqueue_id, roxy_mqueues[mqueue_id].channel_name);
        }
        return -1;
    }
    return mqueue_attr.mq_curmsgs;
}

enum roxy_status_code roxy_mqueue_flush(unsigned mqueue_id)
{
    char channel_name[ROXY_MQUEUE_NAME_LENGTH];
    int ret;
    sprintf(channel_name, "/%x", mqueue_id);
    ret = mq_unlink(channel_name);
    if (ret)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to unlink the mqueue (mqueue_id=%d , channel_name=%s) error_code=%d\n", mqueue_id, channel_name, ret);
        }
        return RUNTIME_ERROR;
    }
    if (ROXY_DEBUG)
    {
        printf("ROXY-SYSTEM: Successfully unlink mqueue (mqueue_id=%d , channel_name=%s)\n", mqueue_id, channel_name);
    }
}

enum roxy_status_code roxy_event_send(unsigned event_id)
{
    if (event_id >= ROXY_EVENT_COUNT)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Invalid event (event_id=%d)\n", event_id);
        }
        return RUNTIME_ERROR;
    }
    /*
    int ret;
    ret = kill(0, ROXY_EVENT_SIGDISPLACEMENT + event_id); // send to all thread
    if (ret)
    {

        extern int errno;
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to send event (event_id=%d , SID_id=%d) error_code=%d\n", event_id, ROXY_EVENT_SIGDISPLACEMENT + event_id, errno);
        }
        return RUNTIME_ERROR;
    }
    */
    pthread_mutex_lock(&roxy_events[event_id].protect_mutex);
    roxy_events[event_id].gate = ROXY_EVENT_GATEOPEN;
    pthread_cond_broadcast(&roxy_events[event_id].waiting_condition);
    pthread_mutex_unlock(&roxy_events[event_id].protect_mutex);
    return SUCCESS;
}

enum roxy_status_code roxy_event_receive(unsigned event_id)
{
    if (event_id >= ROXY_EVENT_COUNT)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Invalid event (event_id=%d)\n", event_id);
        }
        return RUNTIME_ERROR;
    }
    /*
    sigset_t sigset;
    sigemptyset(&sigset);
    sigaddset(&sigset, event_id + ROXY_EVENT_SIGDISPLACEMENT);
    int sig, ret;
    ret = sigwait(&sigset, &sig);
    if (ret)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to receive event (event_id=%d , SID_id=%d) error_code=%d\n", event_id, ROXY_EVENT_SIGDISPLACEMENT + event_id, ret);
        }
        return RUNTIME_ERROR;
    }
    */
    /*
     roxy_critical_section_enter(ROXY_SYSTEM_CRITICAL_SECTION_ID);
     roxy_event_gates[event_id] = 1;
     roxy_critical_section_leave(ROXY_SYSTEM_CRITICAL_SECTION_ID);
     while (roxy_event_gates[event_id] != 0)
     {
         roxy_task_wait(1000, ROXY_WAIT_NANOSECOND);
     }
     */
    // lock the gate
    pthread_mutex_lock(&roxy_events[event_id].protect_mutex);
    roxy_events[event_id].gate = ROXY_EVENT_GATECLOSE;
    while (roxy_events[event_id].gate == ROXY_EVENT_GATECLOSE)
    {
        pthread_cond_wait(&roxy_events[event_id].waiting_condition, &roxy_events[event_id].protect_mutex);
    }
    pthread_mutex_unlock(&roxy_events[event_id].protect_mutex);
    return SUCCESS;
}

void roxy_signal_handler(int signal_vector)
{
    if (roxy_interrupts[signal_vector] == NULL)
    {
        return;
    }
    void (*signal_callback_function)();
    signal_callback_function = roxy_interrupts[signal_vector];
    signal_callback_function();
    return;
}

enum roxy_status_code roxy_interrupt_catch(unsigned signal_id, void *function_ptr)
{
    struct sigaction signal_action;
    signal_action.sa_handler = function_ptr;
    sigemptyset(&signal_action.sa_mask);
    sigaddset(&signal_action.sa_mask, signal_id);
    if (signal_id >= ROXY_INTERRUPT_COUNT)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Interrupt signal out of bound (signal_id=%d)\n", signal_id);
        }
    }
    int ret;
    ret = sigaction(signal_id, &signal_action, NULL);
    if (ret)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Error setting up signal handler at signal_id=%d\n", signal_id);
        }
        return RUNTIME_ERROR;
    }
    return SUCCESS;
}
