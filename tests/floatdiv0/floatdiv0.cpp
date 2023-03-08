#include "userosc.h"
#include "osc_api.h"
#include <limits.h>
#include "/home/nick/faustilogue/src/fasthmath.cpp"

void OSC_INIT(uint32_t platform, uint32_t api)
{
  (void)platform;
  (void)api;
}

float x = (float)INT_MAX * 10;
float y = 0;
float z = 0;

void OSC_CYCLE(const user_osc_param_t * const params,
               int32_t *yn,
               uint32_t frames)
{
  for (int i = 0; i < frames; i++) {
    int a = (int)(floorf(y/z));
    a = a + a;
    *yn++ = f32_to_q31(a);
  }
}
