#include "core.h"

#define MAX_SEARCH_ITERATION 100

static struct roxy_task roxy_tasks[ROXY_TASK_COUNT_LIMIT];
static struct roxy_thread roxy_threads[ROXY_THREAD_COUNT_LIMIT];
static pthread_mutex_t roxy_critical_sections[ROXY_CRITICAL_SECTION_COUNT_LIMIT];

enum roxy_status_code roxy_init()
{
    // init random generator
    srand(ROXY_RANDOM_SEED);
    // init tasks and threads
    for (int i = 0; i < ROXY_TASK_COUNT_LIMIT; i++)
    {
        struct roxy_task default_task = {TASK_EMPTY, ROXY_TASK_PREINIT_PRIORITY, NULL, NULL, NULL, NULL, {[0 ... ROXY_TASK_THREAD_LIMIT - 1] = ROXY_TASK_PREINIT_THREADID}};
        roxy_tasks[i] = default_task;
    }

    for (int i = 0; i < ROXY_THREAD_COUNT_LIMIT; i++)
    {
        roxy_threads[i].status = THREAD_EMPTY;
        roxy_threads[i].os_thread_id = ROXY_THREAD_PREINIT_OS_THREADID;
    }
    for (int i = 0; i < ROXY_CRITICAL_SECTION_COUNT_LIMIT; i++)
    {
        pthread_mutex_init(&roxy_critical_sections[i], NULL);
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

enum roxy_status_code roxy_task_create(unsigned task_id, unsigned priority, void *constructor_ptr, void *function_ptr, void *deconstructor_ptr, void *argument_ptr)
{
    if (task_id < ROXY_TASK_COUNT_LIMIT && roxy_tasks[task_id].status == TASK_EMPTY)
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
        printf("ROXY-DEBUG: Task id out-of-bound or task already existed\n");
    }
    return RUNTIME_ERROR;
}

struct arg_struct
{
    unsigned task_id;
    unsigned thread_id;
};

void *roxy_thread_runner(void *data)
{
    struct arg_struct *args = (struct arg_struct *)data;
    void (*task_function)();
    void (*constructor)();
    void (*deconstructor)();
    roxy_threads[args->thread_id].status = THREAD_EXECUTING;
    roxy_threads[args->thread_id].os_thread_id = gettid();
    if (ROXY_DEBUG)
    {
        printf("pthread_id:%lu running on os thread:%d\n", roxy_threads[args->thread_id].posix_thread_id, roxy_threads[args->thread_id].os_thread_id);
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
    if (task_id > ROXY_TASK_COUNT_LIMIT || roxy_tasks[task_id].status == TASK_EMPTY || thread_count > ROXY_TASK_THREAD_LIMIT)
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
            search_index = rand() % ROXY_THREAD_COUNT_LIMIT;
            if (roxy_threads[search_index].status == THREAD_EMPTY)
            {
                struct arg_struct arg = {task_id};
                ret = pthread_create(&roxy_threads[search_index].posix_thread_id, &thread_attr, roxy_thread_runner, &arg);
                if (ret)
                {
                    if (ROXY_DEBUG)
                    {
                        printf("ROXY-DEBUG: create compute pthread failed\n");
                    }
                    return RUNTIME_ERROR;
                }
                pthread_setaffinity_np(roxy_threads[search_index].posix_thread_id, sizeof(cpuset), &cpuset);
                roxy_threads[search_index].status = THREAD_EXECUTING;
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
    if (task_id < 0 || task_id >= ROXY_TASK_COUNT_LIMIT || roxy_tasks[task_id].status == TASK_EMPTY)
    {
        if (ROXY_DEBUG)
        {
            printf("ROXY-DEBUG: Failed to find the task (task_id=%d)\n", task_id);
        }
        return RUNTIME_ERROR;
    }
    for (int i = 0; i < ROXY_TASK_THREAD_LIMIT; i++)
    {
    }
}

enum roxy_status_code roxy_critical_section_enter(unsigned section_id)
{
    if (section_id >= ROXY_CRITICAL_SECTION_COUNT_LIMIT)
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
    if (section_id >= ROXY_CRITICAL_SECTION_COUNT_LIMIT)
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
    if (task_id < 0 || task_id >= ROXY_TASK_COUNT_LIMIT || roxy_tasks[task_id].status == TASK_EMPTY)
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