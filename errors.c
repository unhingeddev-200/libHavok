#include "errors.h"
#include <wchar.h>

static const char *error_text = NULL;
static int error_code = 0;

void hvk_set_err(int code, const char *const in_txt) {
  error_code = code;
  error_text = in_txt;
}

const char *hvk_get_err() {
  return error_text;
}
