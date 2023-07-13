struct roxy_task
{
    unsigned int task_id;
    unsigned int priority;
    char *name;
    void *function_pointer;
    void *argument_pointer;
};
struct roxy_task default_task;