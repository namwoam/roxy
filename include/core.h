#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>

#ifndef CORE_H
#define CORE_H

#include "model.h"
#include "config.h"

enum roxy_status_code roxy_init(void);
enum roxy_status_code roxy_task_create(unsigned task_id, unsigned priority, void *constructor_ptr, void *function_ptr, void *deconstruct_ptr, void *argument_ptr);
enum roxy_status_code roxy_task_start(unsigned, unsigned);
enum roxy_status_code roxy_task_suspend(unsigned);
enum roxy_status_code roxy_task_wake_after(unsigned, unsigned);
enum roxy_status_code roxy_task_set_priority(unsigned, unsigned);

enum roxy_status_code roxy_critical_section_enter(unsigned section_id);
enum roxy_status_code roxy_critical_section_leave(unsigned section_id);

#endif