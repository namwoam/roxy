#include "core.h"

#define MAX_SEARCH_ITERATION 100

static struct roxy_task roxy_tasks[ROXY_TASK_COUNT_LIMIT];
static struct roxy_thread roxy_threads[ROXY_THREAD_COUNT_LIMIT];

enum roxy_status_code roxy_init()
{
    // init random generator
    srand(ROXY_RANDOM_SEED);
    // check system
    for (int i = 0; i < ROXY_TASK_COUNT_LIMIT; i++)
    {
        struct roxy_task default_task = {ROXY_TASK_PREINIT_TASKID, ROXY_TASK_PREINIT_PRIORITY, NULL, NULL, NULL, NULL, {[0 ... ROXY_TASK_THREAD_LIMIT - 1] = ROXY_TASK_PREINIT_THREADID}};
        roxy_tasks[i] = default_task;
    }

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

enum roxy_status_code roxy_task_create(unsigned task_id, unsigned priority, void *constructor_ptr, void *function_ptr, void *deconstruct_ptr, void *argument_ptr)
{
    if (task_id < ROXY_TASK_COUNT_LIMIT && roxy_tasks[task_id].task_id == ROXY_TASK_PREINIT_TASKID)
    {
        // means this task haven't been created
        roxy_tasks[task_id].task_id = task_id;
        roxy_tasks[task_id].priority = priority;
        roxy_tasks[task_id].constructor_pointer = constructor_ptr;
        roxy_tasks[task_id].function_pointer = function_ptr;
        roxy_tasks[task_id].deconstructor_pointer = deconstruct_ptr;
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
};

void *roxy_thread_runner(void *data)
{
    struct arg_struct *args = (struct arg_struct *)data;
    void (*task_function)();
    task_function = roxy_tasks[args->task_id].function_pointer;
    task_function();
    return NULL;
}

enum roxy_status_code roxy_task_start(unsigned task_id, unsigned thread_count)
{
    if (task_id > ROXY_TASK_COUNT_LIMIT || roxy_tasks[task_id].task_id == ROXY_TASK_PREINIT_TASKID || thread_count > ROXY_TASK_THREAD_LIMIT)
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
    for (unsigned thread_n = 0; thread_n < thread_count; thread_n++)
    {
        int ret;
        /* Lock memory */
        if (mlockall(MCL_CURRENT | MCL_FUTURE) == -1)
        {
            if (ROXY_DEBUG)
            {
                printf("mlockall failed: %m\n");
            }
            exit(-2);
        }
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
            if (roxy_threads[search_index].status == EMPTY)
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
            }
            roxy_threads[search_index].status = EXECUTING;
            roxy_tasks[task_id].thread_ids[thread_n] = search_index;
        }
    }
    for (unsigned thread_n = 0; thread_n < thread_count; thread_n++)
    {
        pthread_join(roxy_threads[roxy_tasks[task_id].thread_ids[thread_n]].posix_thread_id, NULL);
    }
    return SUCCESS;
}

enum roxy_status_code roxy_task_suspend(unsigned task_id)
{
    // no need to implement yeah!
}