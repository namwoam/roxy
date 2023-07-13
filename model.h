struct roxy_task
{
    int task_id;
    int priority;
    void *function_pointer;
    void *argument_pointer;
};
struct roxy_task default_task;