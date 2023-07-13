#include <stdio.h>
#include "config.h"

enum roxy_status_code
{
    SUCCESS = 0,
    CONFIG_ERROR = 1,
    RUNTIME_ERROR = 2
};

const unsigned roxy_thread_count = 2;
const unsigned roxy_task_count_limit = 128;
const unsigned roxy_message_queue_count_limit = 128;
const unsigned roxy_interrupt_count_limit = 128;
const unsigned roxy_event_count_limit = 128;
const unsigned roxy_critical_section_count_limit = 4;

const unsigned roxy_debug = 1;

int main(int argc, char *argv[])
{
    if (roxy_debug == 1){
        printf("Displaying config info for the roxy system:\n");
        printf("roxy_thread_count: %d\n", roxy_thread_count);
        printf("roxy_thread_count: %d\n", roxy_thread_count);

    }
    return 0;
    
}
