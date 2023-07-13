#include <sched.h>
enum roxy_status_code
{
    SUCCESS = 0,
    CONFIG_ERROR = 1,
    RUNTIME_ERROR = 2
};
#define ROXY_CPU_COUNT 2
#define ROXY_THREAD_COUNT_LIMIT 1024
#define ROXY_TASK_COUNT_LIMIT 128
#define ROXY_MESSAGE_QUEUE_COUNT_LIMIT 128
#define ROXY_INTERRUPT_COUNT_LIMIT 128
#define ROXY_EVENT_COUNT_LIMIT 128
#define ROXY_CRITICAL_SECTION_COUNT_LIMIT 16
#define ROXY_MUTEX_COUNT_LIMIT 1024
#define ROXY_SEMAPHOREH_COUNT_LIMIT 1024
#define ROXY_TASK_NAME_LIMIT 64

#define ROXY_PRIORITY_LEVEL_COUNT 64

#define ROXY_SCHEDULE_POLICY SCHED_RR 

#define ROXY_DEBUG 1 // 1 for active
#define ROXY_RANDOM_SEED 8080