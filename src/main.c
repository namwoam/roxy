#include "main.h"

#define ROXY_IDLE_TASK_ID 100

void idle_task()
{
    int p = 0;
    while (1)
    {
        time_t rawtime;
        struct tm *timeinfo;
        time(&rawtime);
        timeinfo = localtime(&rawtime);
        printf("roxy idle on cpu:%d %s", sched_getcpu(), asctime(timeinfo));
        roxy_task_wait(3, ROXY_WAIT_SECOND);
        // roxy_task_set_priority(ROXY_IDLE_TASK_ID, p);
        p = (p + 1) % 10;
    }
    return;
}

int fib(int n)
{
    if (n == 0 || n == 1)
    {
        return 1;
    }
    else
    {
        return fib(n - 1) + fib(n - 2);
    }
}

void compute_task()
{
    while (1)
    {
        for (int i = 0; i < 40; i++)
        {
            printf("fib(%d)=%d on thread:%d \n", i, fib(i), sched_getcpu());
        }
    }
    return;
}

int main(int argc, char *argv[])
{
    enum roxy_status_code status;
    status = roxy_init();
    if (status != SUCCESS)
    {
        printf("Failed at init\n");
        return 0;
    }
    status = roxy_task_create(ROXY_IDLE_TASK_ID, 10, NULL, idle_task, NULL, NULL);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_IDLE_TASK_ID, 1);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_loop(ROXY_IDLE_TASK_ID);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_clean();
    if (status != SUCCESS)
    {
        return 0;
    }
}