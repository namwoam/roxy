/*******************************************************************************
*
*  File Name    :  timer-application.c
*
*  Purpose      :  Testing hardware timer with roxy SDK
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
#include "main.h"
#include <sys/time.h>
/*
#include <gpiod.h>
/*
struct gpiod_chip *chip;
struct gpiod_line *lineRed;

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
    static int led_signal = 0;
    printf("VHF signal fired\n");
    gpiod_line_set_value(lineRed, (led_signal++) % 2);
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
    const char *chipname = "gpiochip0";
    chip = gpiod_chip_open_by_name(chipname);
    lineRed = gpiod_chip_get_line(chip, 21); // check gpioinfo
    gpiod_line_request_output(lineRed, "roxy", 0);
    timer_useconds(125 * 1000); // 125ms
    roxy_loop(100);
    gpiod_line_release(lineRed);
    gpiod_chip_close(chip);
    roxy_clean();
    return 0;
}
**/