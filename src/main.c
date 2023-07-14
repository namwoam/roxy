#include "main.h"

void idle_task()
{
    struct timespec req, rem;
    req.tv_nsec = 500000000; // 0.5sec
    req.tv_sec = 0;
    while (1)
    {
        time_t rawtime;
        struct tm *timeinfo;
        time(&rawtime);
        timeinfo = localtime(&rawtime);
        printf("roxy idle on thread:%d\n", sched_getcpu());
        int t = rand() % 10;
        if (nanosleep(&req, &rem) == -1)
        {
            printf("error at nanosleep!\n");
            exit(1);
        }
    }
    return ;
}

int main(int argc, char *argv[])
{
    roxy_init();
    roxy_task_create(1, 20, NULL, idle_task, NULL, NULL);
    roxy_task_start(1, 10);
}