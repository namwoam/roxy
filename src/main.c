#include "main.h"

#define ROXY_IDLE_TASK_ID 100
#define ROXY_COMPUTE_TASK_ID 101
#define ROXY_SENDER_TASK_ID 102
#define ROXY_RECEIVER_TASK_ID 103
#define MQUEUE_ID 100
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
        printf("message queue pending message:%d\n", roxy_mqueue_get_pending(MQUEUE_ID));
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
#define RANDOM_NAME_SIZE 5
    char random_names[RANDOM_NAME_SIZE][ROXY_MQUEUE_RECOMMENDED_MESSAGE_LENGTH] = {"anakin", "yoda", "ahsoka", "jabba", "luke"};
    while (1)
    {
        p = rand() % RANDOM_NAME_SIZE;
        printf("Sender: sending name->%s \n", random_names[p]);
        roxy_mqueue_send(MQUEUE_ID, random_names[p], ROXY_MQUEUE_RECOMMENDED_MESSAGE_LENGTH);
        roxy_task_wait(1, ROXY_WAIT_SECOND);
    }
}

void receive_task()
{
    char receive_buffer[ROXY_MQUEUE_RECOMMENDED_MESSAGE_LENGTH];
    while (1)
    {
        enum roxy_status_code status;
        status = roxy_mqueue_receive(MQUEUE_ID, receive_buffer, ROXY_MQUEUE_RECOMMENDED_MESSAGE_LENGTH, ROXY_MQUEUE_BLOCKING);
        if (status == RUNTIME_ERROR)
        {
            continue;
        }
        printf("Receiver: received->%s \n", receive_buffer);
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
    status = roxy_task_create(ROXY_COMPUTE_TASK_ID, 10, NULL, compute_task, NULL, NULL);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_create(ROXY_SENDER_TASK_ID, 10, NULL, send_task, NULL, NULL);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_create(ROXY_RECEIVER_TASK_ID, 10, NULL, receive_task, NULL, NULL);
    if (status != SUCCESS)
    {
        return 0;
    }
    roxy_mqueue_flush(MQUEUE_ID);
    status = roxy_mqueue_create(MQUEUE_ID, ROXY_MQUEUE_RECOMMENDED_QUEUE_CAPACITY, ROXY_MQUEUE_RECOMMENDED_MESSAGE_LENGTH);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_IDLE_TASK_ID, 2);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_COMPUTE_TASK_ID, 2);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_SENDER_TASK_ID, 1);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_RECEIVER_TASK_ID, 1);
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