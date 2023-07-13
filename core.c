#include "config.h"
#include "core.h"
#include "model.h"

#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>

static struct roxy_task roxy_tasks[ROXY_TASK_COUNT_LIMIT];
static pthread_t roxy_threads[ROXY_THREAD_COUNT_LIMIT];

enum roxy_status_code roxy_init()
{
    // init random generator
    srand(ROXY_RANDOM_SEED);
    // check system
    for (int i = 0; i < ROXY_TASK_COUNT_LIMIT; i++)
    {
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

#define MAX_SEARCH_ITERATION 1000
enum roxy_status_code roxy_create_task(int task_id, int priority, void *function_ptr, void *argument_ptr)
{
    for (int search_iteration = 0; search_iteration < MAX_SEARCH_ITERATION; search_iteration++)
    {
        unsigned index = rand() % ROXY_TASK_COUNT_LIMIT;
        if (roxy_tasks[index].task_id != -1)
        {
            roxy_tasks[index].task_id = task_id;
            roxy_tasks[index].priority = priority;
            roxy_tasks[index].function_pointer = function_ptr;
            roxy_tasks[index].argument_pointer = argument_ptr;
            return SUCCESS;
        }
    }
    return RUNTIME_ERROR;
}

enum roxy_status_code roxy_task_start(){
    
}

int main(int argc, char *argv[])
{
    roxy_init();
    return 0;
}
