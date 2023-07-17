#include "main.h"

#define ROXY_IDLE_TASK_ID 100
#define ROXY_COMPUTE_TASK_ID 101
#define ROXY_SENDER_TASK_ID 102
#define MQUEUE_ID 25
#define MESSAGE_LENGTH 32
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
        fib(40);
    }
    return;
}

void send_task()
{
    int p = 0;
    char message_buffer[MESSAGE_LENGTH];
    while (1)
    {
        sprintf(message_buffer, "Hello from user %d!", p);
        roxy_mqueue_send(MQUEUE_ID, message_buffer, MESSAGE_LENGTH);
        roxy_task_wait(1, ROXY_WAIT_SECOND);
    }
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
    status = roxy_task_create(ROXY_COMPUTE_TASK_ID, 8, NULL, compute_task, NULL, NULL);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_COMPUTE_TASK_ID, 1);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_mqueue_create(MQUEUE_ID, 20, MESSAGE_LENGTH);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_create(ROXY_SENDER_TASK_ID, 10, NULL, send_task, NULL, NULL);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_SENDER_TASK_ID, 1);
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