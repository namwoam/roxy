#include "config.h"
#include "core.h"
#include "model.h"

#include <pthread.h>
#include <sched.h>
#include <stdio.h>

static struct roxy_task roxy_tasks[ROXY_TASK_COUNT_LIMIT];
static pthread_t roxy_threads[ROXY_THREAD_COUNT_LIMIT];

enum roxy_status_code roxy_init()
{
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

enum roxy_status_code roxy_create_task(char *name_ptr, unsigned name_length, unsigned priority, void *function_ptr, void *argument_ptr)
{
}

int main(int argc, char *argv[])
{
    roxy_init();
    return 0;
}
