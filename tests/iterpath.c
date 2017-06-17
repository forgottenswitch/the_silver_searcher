#include "iterpath.h"
#include <stdio.h>
#include <string.h>

int main(int argc, char **argv) {
    char *path;
    char *dir_end;

    if (argc < 2) {
        return 1;
    }

    path = argv[1];

    for (;;) {
        printf("%s\n", path);

        if (is_filesystem_root(path)) {
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
