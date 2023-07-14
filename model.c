#include "model.h"
#include "config.h"

#include <stdlib.h>

struct roxy_task default_task = {ROXY_TASK_PREINIT_PRIORITY, ROXY_TASK_PREINIT_PRIORITY, NULL, NULL, NULL, NULL, {[0 ... ROXY_TASK_THREAD_LIMIT - 1] = ROXY_TASK_PREINIT_THREADID}};

struct roxy_thread default_thread = {};