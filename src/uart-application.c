#include "main.h"
#include <termios.h>
#include <ctype.h>
void reading_task()
{
    char buffer[16], message[256];
    int buffer_length, message_length, end_of_buffer;
    while (1)
    {
        int serial_port = open("/dev/ttyS0", O_RDWR | O_NOCTTY);
        if (serial_port < 0)
        {
            continue;
        }
        struct termios terminal_setting;
        if (tcgetattr(serial_port, &terminal_setting) != 0)
        {
            printf("Error %i from tcgetattr: %s\n", errno, strerror(errno));
            continue;
        }

        cfsetispeed(&terminal_setting, B9600);
        if (tcsetattr(serial_port, TCSANOW, &terminal_setting) != 0)
        {
            printf("Error %i from tcsetattr: %s\n", errno, strerror(errno));
            continue;
        }
        buffer_length = 0, message_length = 0, end_of_buffer = 0;
        strcpy(message, "");
        do
        {
            buffer_length = read(serial_port, buffer, sizeof(buffer));
            for (int index = 0; index < buffer_length; index++)
            {
                if (!iscntrl(buffer[index]))
                {
                    strncat(message, &buffer[index], 1);
                }
                else
                {
                    end_of_buffer = 1;
                    break;
                }
            }
        } while (buffer_length > 0 && end_of_buffer == 0);
        if (strlen(message) > 0)
        {
            printf("Received Message:(%s)\n", message);
        }

        close(serial_port);
    }
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
    roxy_task_create(101, 10, NULL, NULL, reading_task, NULL);
    roxy_task_start(101, 1);
    roxy_loop(100);
    roxy_clean();
    return 0;
}