#ifndef PRINT_H
#define PRINT_H

#include "util.h"

struct _line_t;
struct _results_t;

void print_path(const char *path, const char sep);
void print_path_count(const char *path, const char sep, const size_t count);
void print_line(const char *buf, size_t buf_pos, size_t prev_line_offset);
void print_binary_file_matches(const char *path);
void print_file_matches(const char *path, const char *buf, const size_t buf_len, const match_t matches[], const size_t matches_len);
void print_line_number(size_t line, const char sep);
void print_column_number(const match_t matches[], size_t last_printed_match,
                         size_t prev_line_offset, const char sep);
void print_file_separator(void);
const char *normalize_path(const char *path);

void print_context_line(const char *s, size_t line_number);
void print_results_as_matched_line(struct _results_t *self, size_t line_number, struct _line_t *line);

#ifdef _WIN32
void windows_use_ansi(int use_ansi);
int fprintf_w32(FILE *fp, const char *format, ...);
#endif

#endif
