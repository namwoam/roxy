#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <errno.h>
#include <sys/resource.h>
#include <fcntl.h>
#include <mqueue.h>
#include <string.h>

#ifndef CORE_H
#define CORE_H

#include "model.h"
#include "config.h"

enum roxy_status_code roxy_init(void);
enum roxy_status_code roxy_loop(unsigned task_id);
enum roxy_status_code roxy_clean(void);
enum roxy_status_code roxy_task_create(unsigned task_id, unsigned priority, void *constructor_ptr, void *function_ptr, void *deconstruct_ptr, void *argument_ptr);
enum roxy_status_code roxy_task_start(unsigned task_id, unsigned thread_count);
enum roxy_status_code roxy_task_suspend(unsigned task_id);

#define ROXY_WAIT_NANOSECOND 0
#define ROXY_WAIT_SECOND 1

enum roxy_status_code roxy_task_wait(unsigned time_interval, unsigned option);
enum roxy_status_code roxy_task_set_priority(unsigned task_id, unsigned new_priority);

enum roxy_status_code roxy_mqueue_create(unsigned mqueue_id, unsigned queue_capacity, unsigned message_maximum_length);
enum roxy_status_code roxy_mqueue_send(unsigned mqueue_id, const char *message_buffer, unsigned message_length);
#define ROXY_MQUEUE_BLOCKING 1
#define ROXY_MQUEUE_NONBLOCKING 0
enum roxy_status_code roxy_mqueue_receive(unsigned mqueue_id, char *message_buffer, unsigned message_length, int blocking);
int roxy_mqueue_get_pending(unsigned mqueue_id);
enum roxy_status_code roxy_mqueue_flush(unsigned mqueue_id);

enum roxy_status_code roxy_critical_section_enter(unsigned section_id);
enum roxy_status_code roxy_critical_section_leave(unsigned section_id);

#endif