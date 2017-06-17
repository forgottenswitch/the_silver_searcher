#include "iterpath.h"
#include <string.h>

/* Returns a pointer to after the last, but not terminating,
 * slash row in a path, or NULL */
char *dirname_end(char *path) {
#ifndef PATHS_ARE_WIN32
    char *slash;

    slash = path + strlen(path);
    if (slash > path) {
        slash--;
    }

    /* skip terminating slash group */
    while (slash > path && *slash == '/') {
        slash--;
    }

    /* skip last name in the path */
    while (slash > path && *slash != '/') {
        slash--;
    }

    if (*slash == '/') {
        return slash + 1;
    }

    return NULL;
#else
    char *slash;

    if (path[0] == '\\') {
        /* "Long" or "native" path ? */
        if (strncmp(path, "\\\\?\\", 4) == 0 || strncmp(path, "\\??\\", 4) == 0) {
            path += 4;
        } else if (strncmp(path, "\\\\.\\", 4) == 0) { /* "device namespace" path? */
            path += 4;
        } else if (strncmp(path, "\\\\", 2) == 0) {
            path += 2;
        }
    }

    slash = path + strlen(path);
    if (slash > path) {
        slash--;
    }

    /* skip terminating slash group */
    while (slash > path && (*slash == '\\' || *slash == '/')) {
        slash--;
    }

    /* skip last name in the path */
    while (slash > path && !(*slash == '\\' || *slash == '/')) {
        slash--;
    }

    if (*slash == '/' || *slash == '\\') {
        return slash + 1;
    }

    return NULL;
#endif
}

/* Checks a path for being "/".
 * On Windows, also checks for "C:", "\\?\C:", "\??\C:", "\\.\", or "\\\\servername". */
int is_filesystem_root(const char *path) {
    if (*path == '\0') {
        return 0;
    }

    if (*path == '/') {
        while (*path == '/') {
            path++;
        }

        return (*path == '\0');
    }

#ifndef PATHS_ARE_WIN32
    return 0;
#else
    int is_unc = 0;
    int is_dev = 0;

    if (path[0] == '\\') {
        /* "Long" or "native" path ? */
        if (strncmp(path, "\\\\?\\", 4) == 0 || strncmp(path, "\\??\\", 4) == 0) {
            path += 4;
        } else if (strncmp(path, "\\\\.\\", 4) == 0) { /* "device namespace" path? */
            path += 4;
            is_dev = 1;
        } else if (strncmp(path, "\\\\", 2) == 0) {
            path += 2;
            is_unc = 1;
        }
    }

    /* Unknown path type starting with a backslash */
    if (*path == '\\') {
        return 0;
    }

    if (is_unc) {
        /* skip server name */
        while (*path != '\0' && *path != '\\' && *path != '/') {
            path++;
        }

        /* accept any number of slashes */
        while (*path == '\\' || *path == '/') {
            path++;
        }

        return (*path == '\0');
    } else {
        /* Skip any drive letter with colon */
        if (!is_dev) {
            if (((*path >= 'A' && *path <= 'Z') || (*path >= 'a' && *path <= 'z')) &&
                (path[1] == ':')) {
                path += 2;
            } else {
                return 0;
            }
        }

        /* accept any number of slashes */
        while (*path == '\\' || *path == '/') {
            path++;
        }

        return (*path == '\0');
    }
#endif
}
