#include "main.h"

#define SCIO_VHF_TASK_ID 100
#define DHS_VHF_TASK_ID 101
#define TC_VHF_TASK_ID 102
#define TM_VHF_TASK_ID 103
#define GCQ_VHF_TASK_ID 104
#define MPQ_VHF_TASK_ID 105
#define SYS_VHF_TASK_ID 106
#define AOCS_VHF_TASK_ID 107
#define PF_VHF_TASK_ID 108
#define PL_VHF_TASK_ID 109
#define TIM_SIM_TASK_ID 110

#define TASK_PRIORITY 10

#define VHF2SCIO_EVENT_ID 10
#define VHF2DHS_EVENT_ID 11
#define VHF2TC_EVENT_ID 12
#define VHF2TM_EVENT_ID 13
#define VHF2GCQ_EVENT_ID 14
#define VHF2MPQ_EVENT_ID 15
#define VHF2SYS_EVENT_ID 16
#define VHF2AOCS_EVENT_ID 17
#define VHF2PF_EVENT_ID 18
#define VHF2PL_EVENT_ID 19
#define AOCS_ACQ_EVENT_ID 101
#define PF_ACQ_EVENT_ID 102
#define PL_ACQ_EVENT_ID 103
#define END_APP_SW_EVENT_ID 104

int work_done;

int seq = 0, scio = 0, dhs = 0, tc = 0, tm = 0, gcq = 0, mpq = 0, sys = 0, aocs = 0, pf = 0, pl = 0;

long get_timestamp()
{
    struct timeval time;
    gettimeofday(&time, NULL);

    return time.tv_sec * 1000 + time.tv_usec / 1000;
}

void unlock_gate_lock()
{
    roxy_critical_section_enter(0);
    if (work_done < 0 || work_done > 3)
    {
        printf("Vital error: custom gate lock malfunction");
        exit(0);
    }
    work_done += 1;
    if (work_done == 3)
    {
        // printf("Gate lock send the END_APP_SW event at:%ld\n", get_timestamp());
        roxy_event_send(END_APP_SW_EVENT_ID);
    }
    else
    {
        // printf("current work_done=%d\n", work_done);
    }
    roxy_critical_section_leave(0);
}

void reset_gate_lock()
{
    roxy_critical_section_enter(0);
    work_done = 0;
    roxy_critical_section_leave(0);
}

void SEQ_interrupt_handler()
{
    // printf("SEQ send the VHF event at:%ld\n", get_timestamp());
    roxy_event_send(VHF2SCIO_EVENT_ID);
    roxy_event_send(VHF2DHS_EVENT_ID);
    roxy_event_send(VHF2TC_EVENT_ID);
    roxy_event_send(VHF2TM_EVENT_ID);
    roxy_event_send(VHF2GCQ_EVENT_ID);
    roxy_event_send(VHF2MPQ_EVENT_ID);
    roxy_event_send(VHF2SYS_EVENT_ID);
    roxy_event_send(VHF2AOCS_EVENT_ID);
    roxy_event_send(VHF2PF_EVENT_ID);
    roxy_event_send(VHF2PL_EVENT_ID);
    seq += 1;
}

void SCIO_VHF_task()
{
    while (1)
    {
        roxy_event_receive(VHF2SCIO_EVENT_ID);
        // printf("SCIO received the VHF event at:%ld\n", get_timestamp());
        // printf("SCIO executing phase 1 at:%ld\n", get_timestamp());
        // printf("SCIO exit at:%ld\n", get_timestamp());
        scio += 1;
    }
}

void TC_VHF_task()
{
    while (1)
    {
        roxy_event_receive(VHF2TC_EVENT_ID);
        // printf("TC received the VHF event at:%ld\n", get_timestamp());
        // printf("TC executing phase 1 at:%ld\n", get_timestamp());
        // printf("TC exit at:%ld\n", get_timestamp());
        tc += 1;
    }
}

void TM_VHF_task()
{
    while (1)
    {
        roxy_event_receive(VHF2TM_EVENT_ID);
        // printf("TM received the VHF event at:%ld\n", get_timestamp());
        // printf("TM executing phase 1 at:%ld\n", get_timestamp());
        // printf("TM exit at:%ld\n", get_timestamp());
        tm += 1;
    }
}

void GCQ_VHF_task()
{
    while (1)
    {
        roxy_event_receive(VHF2GCQ_EVENT_ID);
        // printf("GCQ received the VHF event at:%ld\n", get_timestamp());
        // printf("GCQ executing phase 1 at:%ld\n", get_timestamp());
        // printf("GCQ exit at:%ld\n", get_timestamp());
        gcq += 1;
    }
}

void MPQ_VHF_task()
{
    while (1)
    {
        roxy_event_receive(VHF2MPQ_EVENT_ID);
        // printf("MPQ received the VHF event at:%ld\n", get_timestamp());
        // printf("MPQ executing phase 1 at:%ld\n", get_timestamp());
        // printf("MPQ exit at:%ld\n", get_timestamp());
        mpq += 1;
    }
}

void SYS_VHF_task()
{
    while (1)
    {
        roxy_event_receive(VHF2SYS_EVENT_ID);
        // printf("SYS received the VHF event at:%ld\n", get_timestamp());
        // printf("SYS executing phase 1 at:%ld\n", get_timestamp());
        roxy_event_receive(END_APP_SW_EVENT_ID);
        // printf("SYS received the END_APP_SW event at:%ld\n", get_timestamp());
        // printf("SYS executing phase 2 at:%ld\n", get_timestamp());
        // printf("SYS exit at:%ld\n", get_timestamp());
        sys += 1;
    }
}

void AOCS_VHF_task()
{
    while (1)
    {
        roxy_event_receive(VHF2AOCS_EVENT_ID);
        // printf("AOCS received the VHF event at:%ld\n", get_timestamp());
        // printf("AOCS executing phase 1 at:%ld\n", get_timestamp());
        roxy_event_receive(AOCS_ACQ_EVENT_ID);
        // printf("AOCS received the AOCS_ACQ event at:%ld\n", get_timestamp());
        // printf("AOCS executing phase 2 at:%ld\n", get_timestamp());
        unlock_gate_lock();
        // printf("AOCS exit at:%ld\n", get_timestamp());
        aocs += 1;
    }
}

void PF_VHF_task()
{
    while (1)
    {
        roxy_event_receive(VHF2PF_EVENT_ID);
        // printf("PF received the VHF event at:%ld\n", get_timestamp());
        // printf("PF executing phase 1 at:%ld\n", get_timestamp());
        roxy_event_receive(PF_ACQ_EVENT_ID);
        // printf("PF received the PF_ACQ event at:%ld\n", get_timestamp());
        // printf("PF executing phase 2 at:%ld\n", get_timestamp());
        unlock_gate_lock();
        // printf("PF exit at:%ld\n", get_timestamp());
        pf += 1;
    }
}

void PL_VHF_task()
{
    while (1)
    {
        roxy_event_receive(VHF2PL_EVENT_ID);
        // printf("PL received the VHF event at:%ld\n", get_timestamp());
        // printf("PL executing phase 1 at:%ld\n", get_timestamp());
        roxy_event_receive(PL_ACQ_EVENT_ID);
        // printf("PL received the PL_ACQ event at:%ld\n", get_timestamp());
        // printf("PL executing phase 2 at:%ld\n", get_timestamp());
        unlock_gate_lock();
        // printf("PL exit at:%ld\n", get_timestamp());
        pl += 1;
    }
}

void DHS_VHF_task()
{
    while (1)
    {
        reset_gate_lock();
        roxy_event_receive(VHF2DHS_EVENT_ID);
        // printf("DHS received the VHF event at:%ld\n", get_timestamp());
        roxy_task_wait(10 * 1000 * 1000, ROXY_WAIT_NANOSECOND);
        // printf("DHS executing phase 1 at:%ld\n", get_timestamp());
        // printf("DHS executing phase 2 at:%ld\n", get_timestamp());
        // printf("DHS send the AOCS_ACQ event at:%ld\n", get_timestamp());
        roxy_event_send(AOCS_ACQ_EVENT_ID);
        // printf("DHS executing phase 3 at:%ld\n", get_timestamp());
        // printf("DHS send the PF_ACQ event at:%ld\n", get_timestamp());
        roxy_event_send(PF_ACQ_EVENT_ID);
        // printf("DHS executing phase 4 at:%ld\n", get_timestamp());
        // printf("DHS send the PL_ACQ event at:%ld\n", get_timestamp());
        roxy_event_send(PL_ACQ_EVENT_ID);
        roxy_event_receive(END_APP_SW_EVENT_ID);
        // printf("DHS received the END_APP_SW event at:%ld\n", get_timestamp());
        // printf("DHS executing phase 5 at:%ld\n", get_timestamp());
        // printf("DHS exit at:%ld\n", get_timestamp());
        dhs += 1;
    }
}

void timer_simulator()
{
#define ITERATION_LIMIT 1000
    for (int iteration = 0; iteration < ITERATION_LIMIT; iteration++)
    {
        SEQ_interrupt_handler();
        roxy_task_wait(125 * 1000 * 1000, ROXY_WAIT_NANOSECOND);
    }
}

int main(int argc, char *argv[])
{
    roxy_init();
    roxy_task_create(SCIO_VHF_TASK_ID, TASK_PRIORITY, NULL, SCIO_VHF_task, NULL, NULL);

    roxy_task_create(DHS_VHF_TASK_ID, TASK_PRIORITY, NULL, DHS_VHF_task, NULL, NULL);
    roxy_task_create(TC_VHF_TASK_ID, TASK_PRIORITY, NULL, TC_VHF_task, NULL, NULL);
    roxy_task_create(TM_VHF_TASK_ID, TASK_PRIORITY, NULL, TM_VHF_task, NULL, NULL);
    roxy_task_create(GCQ_VHF_TASK_ID, TASK_PRIORITY, NULL, GCQ_VHF_task, NULL, NULL);
    roxy_task_create(MPQ_VHF_TASK_ID, TASK_PRIORITY, NULL, MPQ_VHF_task, NULL, NULL);

    roxy_task_create(SYS_VHF_TASK_ID, TASK_PRIORITY, NULL, SYS_VHF_task, NULL, NULL);

    roxy_task_create(AOCS_VHF_TASK_ID, TASK_PRIORITY, NULL, AOCS_VHF_task, NULL, NULL);
    roxy_task_create(PF_VHF_TASK_ID, TASK_PRIORITY, NULL, PF_VHF_task, NULL, NULL);
    roxy_task_create(PL_VHF_TASK_ID, TASK_PRIORITY, NULL, PL_VHF_task, NULL, NULL);

    roxy_task_create(TIM_SIM_TASK_ID, 20, NULL, timer_simulator, NULL, NULL);

    roxy_task_start(SCIO_VHF_TASK_ID, 1);
    roxy_task_start(DHS_VHF_TASK_ID, 1);
    roxy_task_start(TC_VHF_TASK_ID, 1);
    roxy_task_start(TM_VHF_TASK_ID, 1);
    roxy_task_start(GCQ_VHF_TASK_ID, 1);
    roxy_task_start(MPQ_VHF_TASK_ID, 1);

    roxy_task_start(SYS_VHF_TASK_ID, 1);

    roxy_task_start(AOCS_VHF_TASK_ID, 1);
    roxy_task_start(PF_VHF_TASK_ID, 1);
    roxy_task_start(PL_VHF_TASK_ID, 1);

    roxy_task_start(TIM_SIM_TASK_ID, 1);
    roxy_loop(TIM_SIM_TASK_ID);
    roxy_clean();
    printf("seq=%d, scio=%d, dhs=%d, tc=%d, tm=%d, gcq=%d, mpq=%d\n", seq, scio, dhs, tc, tm, gcq, mpq);
    printf("sys=%d, aocs=%d, pf=%d, pl=%d\n", sys, aocs, pf, pl);
}