#include "userosc.h"
#include "osc_api.h"

void OSC_INIT(uint32_t platform, uint32_t api)
{
  (void)platform;
  (void)api;
}

uint32_t time = 0;
uint32_t bit = 0;

void OSC_CYCLE(const user_osc_param_t * const params,
               int32_t *yn,
               uint32_t frames)
{
  for (int i = 0; i < frames; i++) {
    uint32_t stackptr;
    __asm__("mov %0, sp" : "=r"(stackptr));
    //stackptr = 0x12345678;
    float freq;
    uint32_t mask = 1 << (31 - bit);
    if (stackptr & mask) freq = 400; else freq = 200;
    *yn++ = f32_to_q31(osc_sinf((float)time * freq / 48000));
    time++;
  }
}

void OSC_PARAM(uint16_t index, uint16_t value) {
    if (index == k_user_osc_param_id1) {
        bit = value;
        if (bit < 0 || bit > 31) while(1);
    }
}
