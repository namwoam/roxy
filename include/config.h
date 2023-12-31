/*******************************************************************************
*
*  File Name    :  config.h
*
*  Purpose      :  Exported configuration settings in the roxy system
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
#include <sched.h>
#include <limits.h>
#ifndef CONFIG_H
#define CONFIG_H
enum roxy_status_code
{
    SUCCESS = 0,
    CONFIG_ERROR = 1,
    RUNTIME_ERROR = 2
};
#define ROXY_CPU_COUNT 2
#define ROXY_THREAD_COUNT 1024
#define ROXY_TASK_COUNT 128
#define ROXY_MQUEUE_COUNT 128
#define ROXY_EVENT_COUNT 128
#define ROXY_CRITICAL_SECTION_COUNT 16
#define ROXY_TASK_THREAD_LIMIT 8
#define ROXY_THREAD_STACK_SIZE PTHREAD_STACK_MIN

#define ROXY_PRIORITY_LEVEL_COUNT 64
#define ROXY_MQUEUE_NAME_LENGTH 8

#define ROXY_SCHEDULE_POLICY SCHED_RR

#define ROXY_DEBUG 0 // 1 for active
#define ROXY_RANDOM_SEED 8080

#define ROXY_MQUEUE_RECOMMENDED_MESSAGE_LENGTH 256
#define ROXY_MQUEUE_RECOMMENDED_QUEUE_CAPACITY 512

#define ROXY_EVENT_GATEOPEN 0
#define ROXY_EVENT_GATECLOSE 1

#define ROXY_INTERRUPT_COUNT 64 // SIGRTMAX

#endif