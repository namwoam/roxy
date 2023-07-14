#include <pthread.h>
#include <config.h>

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
struct roxy_task default_task;

enum thread_status
{
    EMPTY = 0,
    EXECUTING = 1,
    TERMINATED = 2,
};

struct roxy_thread
{
    unsigned thread_id;
    pthread_t posix_thread_id;
    enum thread_status status;
    // artifact of roxy_task_suspend
    int suspend_flag;
    pthread_mutex_t suspend_mutex;
    pthread_cond_t resume_condition;
};

struct roxy_task default_thread;