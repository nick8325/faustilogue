#include "userosc.h"
#include "osc_api.h"

uint32_t* volatile DEMCR = (uint32_t*) 0xe000edfc;
uint32_t* volatile DWT_CTRL = (uint32_t*) 0xe0001000;
uint32_t* volatile DWT_CYCCNT = (uint32_t*) 0xe0001004;

void OSC_INIT(uint32_t platform, uint32_t api)
{
  (void)platform;
  (void)api;

  *DEMCR |= 0x01000000;
  *DWT_CTRL &= ~1;
  *DWT_CYCCNT = 0;
  *DWT_CTRL |= 1;
}

uint32_t time = 0;
uint32_t bit = 0;
uint32_t last_clocks = 0;

void OSC_CYCLE(const user_osc_param_t * const params,
               int32_t *yn,
               uint32_t frames)
{
  uint32_t clocks = *DWT_CYCCNT;
  for (int i = 0; i < frames; i++) {
    float freq;
    uint32_t mask = 1 << (31 - bit);
    if ((clocks - last_clocks) & mask) freq = 400; else freq = 200;
    *yn++ = f32_to_q31(osc_sinf((float)time * freq / 48000));
    time++;
  }
  last_clocks = clocks;
}

void OSC_PARAM(uint16_t index, uint16_t value) {
    if (index == k_user_osc_param_id1) {
        bit = value;
        if (bit < 0 || bit > 31) while(1);
    }
}
