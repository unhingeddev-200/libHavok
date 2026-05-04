#ifndef HVK_ERRORS_H
#define HVK_ERRORS_H
#include <stdint.h>

void hvk_set_err(int code, const char *const in_txt);
const char *hvk_get_err();
#endif
