/*******************************************************************************
*
*  File Name    :  example-application.c
*
*  Purpose      :  Example application for the roxy SDK
*
*  References   :  None
*
*  Design Notes :  None
*
*  Author       :  An-Che Liang
*
*  Project      :  Platfrom Migration Experiment
*
*  Target       :  Raspberry Pi 3B / Linux
*
*  Modification History:
*                  Baseline, 2023-08
*
*******************************************************************************/

/*
#include "main.h"

#define ROXY_IDLE_TASK_ID 100
#define ROXY_COMPUTE_TASK_ID 101
#define ROXY_SENDER_TASK_ID 102
#define ROXY_RECEIVER_TASK_ID 103
#define ROXY_CLOCK_TASK_ID 104
#define ROXY_DISPLAY_TASK_ID 105
#define CLOCK_EVENT_ID 0
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
        // printf("message queue pending message:%d\n", roxy_mqueue_get_pending(MQUEUE_ID));
        roxy_task_wait(10, ROXY_WAIT_SECOND);
        // roxy_task_set_priority(ROXY_IDLE_TASK_ID, p);
        // p = (p + 1) % 10;
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
        for (int i = 0; i < 30; i++)
        {
            printf("fib(%d)=%d\n", i, fib(i));
            roxy_task_wait(1, ROXY_WAIT_SECOND);
        }
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

void clock_task()
{
    while (1)
    {
        printf("Clock: Clock ticking\n");
        roxy_event_send(CLOCK_EVENT_ID);
        roxy_task_wait(4, ROXY_WAIT_SECOND);
    }
}

void display_clock()
{
    while (1)
    {
        roxy_event_receive(CLOCK_EVENT_ID);
        printf("Display: Clock ticked!\n");
    }
}

void exit_handler()
{
    printf("Peace out!\n");
    fflush(stdout);
    exit(0);
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
    roxy_mqueue_flush(MQUEUE_ID);
    status = roxy_mqueue_create(MQUEUE_ID, ROXY_MQUEUE_RECOMMENDED_QUEUE_CAPACITY, ROXY_MQUEUE_RECOMMENDED_MESSAGE_LENGTH);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_create(ROXY_IDLE_TASK_ID, 10, NULL, idle_task, NULL, NULL);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_create(ROXY_COMPUTE_TASK_ID, 11, NULL, compute_task, NULL, NULL);
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
    status = roxy_task_create(ROXY_CLOCK_TASK_ID, 10, NULL, clock_task, NULL, NULL);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_create(ROXY_DISPLAY_TASK_ID, 10, NULL, display_clock, NULL, NULL);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_IDLE_TASK_ID, 5);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_COMPUTE_TASK_ID, 2);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_SENDER_TASK_ID, 2);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_RECEIVER_TASK_ID, 2);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_CLOCK_TASK_ID, 1);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_task_start(ROXY_DISPLAY_TASK_ID, 1);
    if (status != SUCCESS)
    {
        return 0;
    }
    status = roxy_interrupt_catch(SIGINT, exit_handler);
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
*/