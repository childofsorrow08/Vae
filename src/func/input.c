#include <helpers/string_compare.h>

#include <func/print.h>
#include <func/cmos_time.h>

#include <drivers/terminal.h>
#include <drivers/keyboard.h>

typedef enum {
    CMD_UNKNOWN = 0,
    CMD_HELP,
    CMD_TIME,
    CMD_CLEAR,
    CMD_DATE,
    CMD_NOTHING
} cmd_id_t;

cmd_id_t get_cmd_id(const char* str) {
    if (string_compare(str, "help") == 0)       return CMD_HELP;
    if (string_compare(str, "clear") == 0)      return CMD_CLEAR;
    if (string_compare(str, "time") == 0)       return CMD_TIME;
    if (string_compare(str, "date") == 0)       return CMD_DATE;

    if (string_compare(str, "") == 0)           return CMD_NOTHING;
    return CMD_UNKNOWN;
}

void input (char* str) {
    switch (get_cmd_id(str)) {

        // help
        case (CMD_HELP): {
            break;
        }

        // clear
        case (CMD_CLEAR): {
            terminal_clear();

            break;
        }

        // time
        case (CMD_TIME): {
            sys_time time;
            get_time(&time);

            print("%d:%d:%d\n", time.hour, time.minute, time.second);

            break;
        }

        // date
        case (CMD_DATE): {
            sys_time time;
            get_time(&time);

            print("DD|MM|YY\n");
            print("%d.%d.%d\n", time.day, time.month, time.year);

            break; 
        }

        // nothing, skip
        case (CMD_NOTHING): {
            break; 
        }

        // unknown command
        default:
            print("Unknown command: %s. Type 'help' for list.\n", str);
            break;
    }
}