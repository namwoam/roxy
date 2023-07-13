enum roxy_status_code roxy_init(void);
enum roxy_status_code roxy_task_create(unsigned, unsigned, void *, void *);
enum roxy_status_code roxy_task_start(unsigned);
enum roxy_status_code roxy_task_suspend(unsigned);
enum roxy_status_code roxy_task_wake_after(unsigned, unsigned);
enum roxy_status_code roxy_task_set_priority(unsigned, unsigned);
