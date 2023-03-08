#include <stdint.h>

#ifdef __cplusplus
#include <cmath>
#else
#include <math.h>
#endif

#include "utils/float_math.h"

#ifdef __cplusplus
extern "C" {
#endif

static inline float fast_fabsf(float x) { return si_fabsf(x); }
static inline float fast_acosf(float x) { return acosf(x); }
static inline float fast_asinf(float x) { return asinf(x); }
static inline float fast_atanf(float x) { return atanf(x); }
static inline float fast_atan2f(float x, float y) { return atan2f(x, y); }
static inline float fast_ceilf(float x) { return ceilf(x); }
static inline float fast_cosf(float x) { return fastcosfullf(x); }
static inline float fast_expf(float x) { return fastexpf(x); }
static inline float fast_exp2f(float x) { return fastexpf(M_LN2 * x); };
static inline float fast_exp10f(float x) { return fastexpf(M_LN10 * x); };
// si_floorf only works on uint32_t - same applies to ceil, round
static inline float fast_floorf(float x) { return floorf(x); }
static inline float fast_fmodf(float x, float y) { return fmodf(x, y); }
static inline float fast_logf(float x) { return fastlogf(x); }
static inline float fast_log2f(float x) { return fastlog2f(x); }
static inline float fast_log10f(float x) { return (M_LOG10E * M_LN2) * fastlog2f(x); }
static inline float fast_powf(float x, float y) { return fastpowf(x, y); }
static inline float fast_remainderf(float x, float y) { return remainderf(x, y); }
static inline float fast_rintf(float x) { return rintf(x); }
static inline float fast_roundf(float x) { return roundf(x); }
static inline float fast_sinf(float x) { return fastsinfullf(x); }
static inline float fast_sqrtf(float x) { return sqrtf(x); }
static inline float fast_tanf(float x) { return fasttanfullf(x); }

#ifdef __cplusplus
}
#endif
