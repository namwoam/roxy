#include <stdlib.h>
struct roxy_task
{
    unsigned int task_id;
    unsigned int priority;
    void *function_pointer;
    void *argument_pointer;
} default_task = {-1, -1, NULL, NULL};