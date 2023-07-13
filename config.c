#include <stdio.h>
#include "config.h"

const unsigned roxy_thread_count = 2;
const unsigned roxy_task_count_limit = 128;
const unsigned roxy_message_queue_count_limit = 128;
const unsigned roxy_interrupt_count_limit = 128;
const unsigned roxy_event_count_limit = 128;
const unsigned roxy_critical_section_count_limit = 4; // can be used on different resources

const unsigned roxy_debug = 1;

int main(int argc, char *argv[])
{
    if (roxy_debug == 1)
    {
        printf("Displaying config info for the roxy SDK:\n");
        printf("--roxy_thread_count: %d\n", roxy_thread_count);
        printf("--roxy_task_count_limit: %d\n", roxy_task_count_limit);
        printf("--roxy_message_queue_count_limit: %d\n", roxy_message_queue_count_limit);
        printf("--roxy_interrupt_count_limit: %d\n", roxy_interrupt_count_limit);
        printf("--roxy_event_count_limit: %d\n", roxy_event_count_limit);
        printf("--roxy_critical_section_count_limit: %d\n", roxy_critical_section_count_limit);
        printf("End of roxy config info\n");
    }
    return 0;
}
