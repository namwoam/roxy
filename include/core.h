#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <errno.h>

#ifndef CORE_H
#define CORE_H

#include "model.h"
#include "config.h"

enum roxy_status_code roxy_init(void);
enum roxy_status_code roxy_loop(unsigned task_id);
enum roxy_status_code roxy_task_create(unsigned task_id, unsigned priority, void *constructor_ptr, void *function_ptr, void *deconstruct_ptr, void *argument_ptr);
enum roxy_status_code roxy_task_start(unsigned task_id, unsigned thread_count);
enum roxy_status_code roxy_task_suspend(unsigned);

#define ROXY_WAIT_NANOSECOND 0
#define ROXY_WAIT_SECOND 1

enum roxy_status_code roxy_task_wait(unsigned time_interval, unsigned option);
enum roxy_status_code roxy_task_set_priority(unsigned task_id, unsigned new_priority);

enum roxy_status_code roxy_critical_section_enter(unsigned section_id);
enum roxy_status_code roxy_critical_section_leave(unsigned section_id);

#endif