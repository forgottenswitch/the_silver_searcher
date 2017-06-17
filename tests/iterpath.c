#include "iterpath.h"
#include <stdio.h>
#include <string.h>

int main(int argc, char **argv) {
    char *path;
    char *dir_end;
    char buf[1000];

    if (argc < 2) {
        return 1;
    }

    path = argv[1];

    for (;;) {
        snprintf(buf, sizeof buf, "%s/", path);
        printf("%s\n", buf);

        if (is_filesystem_root(buf)) {
            printf("ROOT\n");
        }

        dir_end = dirname_end(path);
        if (dir_end == NULL) {
            break;
        }
        *dir_end = '\0';
    }

    return 0;
}
