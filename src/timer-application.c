#include "main.h"
#include <sys/time.h>

void timer_useconds(long int useconds)
{
    struct itimerval timer_config;

    timer_config.it_interval.tv_usec = useconds;
    timer_config.it_interval.tv_sec = 0;
    timer_config.it_value.tv_usec = useconds;
    timer_config.it_value.tv_sec = 0;

    setitimer(ITIMER_REAL, &timer_config, NULL);
}

void timer_handler()
{
    printf("VHF signal fired\n");
}

void idle_task()
{
    while (1)
    {
        printf("program running\n");
        roxy_task_wait(1, ROXY_WAIT_SECOND);
    }
}

int main(int argc, char *argv[])
{
    roxy_init();
    roxy_task_create(100, 10, NULL, NULL, idle_task, NULL);
    roxy_task_start(100, 1);
    roxy_interrupt_catch(SIGALRM, timer_handler);
    timer_useconds(125 * 1000); // 125ms
    roxy_loop(100);
    roxy_clean();
    return 0;
}