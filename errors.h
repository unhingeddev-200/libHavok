#ifndef HVK_ERRORS_H
#define HVK_ERRORS_H
#include <stdint.h>

typedef enum HVK_Errors {
  ERR_STACK_OVERFLOW = 1,
  ERR_STACK_EMPTY,
  ERR_ACCESS_VIOLATION,
} HVK_Errors;

void hvk_set_err(HVK_Errors code, const char *const in_txt);
const char *hvk_get_err();
#endif
