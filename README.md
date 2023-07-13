# Roxy
## RTOS(RTEMS)-like realtime application SDK using pure POSIX interface ontop of preempt-rt linux

## Spec

We want to implement the following object/function with POSIX interface (found at `.SRC/DHS/EXECUTIVE/if_rtos.h`)

```c
/* Define Task Function */
rtos_status_code rtos_task_create( t_task_id p_task_id );

rtos_status_code rtos_task_start( t_task_id       p_task_id,
                                  rtos_task_entry p_entry_point );

rtos_status_code rtos_task_suspend( t_task_id p_task_id );

rtos_status_code rtos_task_wake_after( rtos_interval p_interval );

rtos_status_code rtos_task_set_priority( t_task_id           p_task_id,
                                         rtos_task_priority  p_new,
                                         rtos_task_priority *p_old );

t_task_id rtos_current_task( void );

/* Define Message Function   */
rtos_status_code rtos_message_queue_create( rtos_name    p_name,
                                            t_natural32  p_counter,
                                            t_natural32  p_max_message_size,
                                            rtos_id     *p_id );

rtos_status_code rtos_message_queue_send( rtos_id       p_id,
                                          void         *p_buffer,
                                          t_natural32   p_size );

rtos_status_code rtos_message_queue_receive( rtos_id       p_id,
                                             void         *p_buffer,
                                             t_natural32  *p_size,
                                             t_boolean     p_no_wait );

rtos_status_code rtos_message_queue_get_number_pending( rtos_id       p_id,
                                                        t_natural32  *p_counter );

rtos_status_code rtos_message_queue_flush( rtos_id  p_id );

/* Define Interrupt Function */
rtos_status_code rtos_interrupt_catch( t_isr_id        p_isr_id,
                                       rtos_isr_entry  p_new_isr_handler );

/* Define Event Function */
rtos_status_code rtos_event_receive( rtos_event_set p_event_in );

rtos_status_code rtos_event_receive_with_timeout( rtos_event_set p_event_in );

rtos_status_code rtos_event_send( t_task_id       p_task_id,
                                  rtos_event_set  p_event_in );

/* Define critical section protection function */
rtos_status_code rtos_enter_region( void );
rtos_status_code rtos_leave_region( void );
```