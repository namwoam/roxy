/*******************************************************************************
*
*  File Name    :  model.h
*
*  Purpose      :  Exported types for structs used in the roxy system
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
#include <pthread.h>

#ifndef MODEL_H
#define MODEL_H

#include "config.h"

// #define ROXY_TASK_PREINIT_TASKID -1
#define ROXY_TASK_PREINIT_PRIORITY -1
#define ROXY_TASK_PREINIT_THREADID -1

#define ROXY_THREAD_PREINIT_THREADID -1
#define ROXY_THREAD_PREINIT_OS_THREADID -1

enum task_status
{
    TASK_EMPTY = 0,
    TASK_LOADED = 1,
    TASK_EXECUTING = 2,
    TASK_TERMINATED = 3,

};

struct roxy_task
{
    enum task_status status;
    unsigned priority;
    void *constructor_pointer;
    void *function_pointer;
    void *argument_pointer;
    void *deconstructor_pointer;
    unsigned thread_ids[ROXY_TASK_THREAD_LIMIT];
};

enum thread_status
{
    THREAD_EMPTY = 0,
    THREAD_EXECUTING = 1,
    THREAD_TERMINATED = 2,
};
struct thread_arg
{
    unsigned task_id;
    unsigned thread_id;
};
struct roxy_thread
{
    pthread_t posix_thread_id;
    enum thread_status status;
    int os_thread_id;
    struct thread_arg arg;
};

struct roxy_mqueue
{
    char channel_name[ROXY_MQUEUE_NAME_LENGTH + 3];
    struct mq_attr mqueue_attribute;
};

struct roxy_event
{
    pthread_mutex_t protect_mutex;
    pthread_cond_t waiting_condition;
    int gate;
};

#endif