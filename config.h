enum roxy_status_code
{
    SUCCESS = 0,
    CONFIG_ERROR = 1,
    RUNTIME_ERROR = 2
};

extern const unsigned roxy_thread_count;
extern const unsigned roxy_task_count_limit;
extern const unsigned roxy_message_queue_count_limit;
extern const unsigned roxy_interrupt_count_limit;
extern const unsigned roxy_event_count_limit;
extern const unsigned roxy_critical_section_count_limit;

extern const unsigned roxy_debug;