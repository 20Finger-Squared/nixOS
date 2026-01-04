#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

int main(void) {
  char cmd[256], buf[128];
  time_t t;
  struct tm *tm;

  while (1) {
    time(&t);
    tm = localtime(&t);
    strftime(buf, sizeof(buf), "%T | %A %d %B", tm);
    sprintf(cmd, "xsetroot -name \"  %s \"", buf);
    (void)system(cmd);
    sleep(1);
  }
  return 0;
}
