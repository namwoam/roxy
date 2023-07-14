#include <pthread.h>

#ifndef MODEL_H
#define MODEL_H

#include "config.h"

#define ROXY_TASK_PREINIT_TASKID -1
#define ROXY_TASK_PREINIT_PRIORITY -1
#define ROXY_TASK_PREINIT_THREADID -1

#define ROXY_THREAD_PREINIT_THREADID -1
#define ROXY_THREAD_PREINIT_THREADID -1
struct roxy_task
{
    unsigned task_id;
    unsigned priority;
    void *constructor_pointer;
    void *function_pointer;
    void *argument_pointer;
    void *deconstructor_pointer;
    unsigned thread_ids[ROXY_TASK_THREAD_LIMIT];
};

enum thread_status
{
    EMPTY = 0,
    EXECUTING = 1,
    TERMINATED = 2,
};

struct roxy_thread
{
    pthread_t posix_thread_id;
    enum thread_status status;
};

#endif