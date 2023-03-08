/* ------------------------------------------------------------
copyright: "(c)Romain Michon, CCRMA (Stanford University), GRAME"
license: "MIT"
name: "ViolinMidi"
Code generated with Faust 2.54.9 (https://faust.grame.fr)
Compilation options: -a src/logue.arch -lang cpp -es 1 -mcd 16 -single -ftz 0
------------------------------------------------------------ */

#ifndef  __mydsp_H__
#define  __mydsp_H__


#include <stdint.h>
#include <algorithm>
#include <fenv.h>
#include <limits.h>
#include "userosc.h"
#include "inputs.h"
#include <math.h>
#define FAUSTFLOAT float

// Boilerplate

class dsp {};

struct Meta {
    void declare(const char* key, const char* value) {};
};

struct Soundfile {};

struct UI {
    void openTabBox(const char* label) {}
    void openHorizontalBox(const char* label) {}
    void openVerticalBox(const char* label) {}
    void closeBox() {}
    void addButton(const char* label, FAUSTFLOAT* zone) {}
    void addCheckButton(const char* label, FAUSTFLOAT* zone) {}
    void addVerticalSlider(const char* label, FAUSTFLOAT* zone, FAUSTFLOAT init, FAUSTFLOAT min, FAUSTFLOAT max, FAUSTFLOAT step) {}
    void addHorizontalSlider(const char* label, FAUSTFLOAT* zone, FAUSTFLOAT init, FAUSTFLOAT min, FAUSTFLOAT max, FAUSTFLOAT step) {}
    void addNumEntry(const char* label, FAUSTFLOAT* zone, FAUSTFLOAT init, FAUSTFLOAT min, FAUSTFLOAT max, FAUSTFLOAT step) {}
    void addHorizontalBargraph(const char* label, FAUSTFLOAT* zone, FAUSTFLOAT min, FAUSTFLOAT max) {}
    void addVerticalBargraph(const char* label, FAUSTFLOAT* zone, FAUSTFLOAT min, FAUSTFLOAT max) {}
    void addSoundfile(const char* label, const char* filename, Soundfile** sf_zone) {}
    void declare(FAUSTFLOAT* zone, const char* key, const char* val) {}
};

// A tiny little heap implementation (no freeing). This is only used (so far)
// at program startup, in the implementation of tables.
extern char __heap_start, __heap_end;
static uintptr_t heap = (uintptr_t) &__heap_end;

static void panic() { while(1); }

void * operator new(unsigned int bytes) {
    heap -= bytes;
    heap &= ~3; // 4-byte align
    if (heap < (uintptr_t) &__heap_start) panic();
    return (void *)heap;
}

void operator delete(void * ptr) {
}

int convert_int(float x) {
  if (isnormal(x) && x >= -1000000 && x <= 1000000)
    return (int)x;
  else
    return 0;
}
#define int(x) convert_int(x)

// We need access to the slider values etc!
#define private public
#ifndef FAUSTFLOAT
#define FAUSTFLOAT float
#endif 

#include <algorithm>
#include <cmath>
#include <cstdint>

#ifndef FAUSTCLASS 
#define FAUSTCLASS mydsp
#endif

#ifdef __APPLE__ 
#define exp10f __exp10f
#define exp10 __exp10
#endif

#if defined(_WIN32)
#define RESTRICT __restrict
#else
#define RESTRICT __restrict__
#endif


class mydsp final : public dsp {
	
 private:
	
	int iRec10[2];
	int IOTA0;
	float fRec23[2];
	float fRec20[2];
	float fRec24[4];
	float fRec25[512];
	float fVec0[2];
	float fVec1[512];
	float fRec17[512];
	float fRec19[2];
	float fRec16[4];
	float fRec14[3];
	int iRec6[2];
	float fRec2[512];
	float fRec0[2];
	int fSampleRate;
	
 public:
	
	void metadata(Meta* m) { 
		m->declare("compile_options", "-a src/logue.arch -lang cpp -es 1 -mcd 16 -single -ftz 0");
		m->declare("copyright", "(c)Romain Michon, CCRMA (Stanford University), GRAME");
		m->declare("delays.lib/fdelay4:author", "Julius O. Smith III");
		m->declare("delays.lib/fdelayltv:author", "Julius O. Smith III");
		m->declare("delays.lib/name", "Faust Delay Library");
		m->declare("delays.lib/version", "0.1");
		m->declare("description", "Simple MIDI-controllable violin physical model.");
		m->declare("filename", "violinMIDI.dsp");
		m->declare("filters.lib/fir:author", "Julius O. Smith III");
		m->declare("filters.lib/fir:copyright", "Copyright (C) 2003-2019 by Julius O. Smith III <jos@ccrma.stanford.edu>");
		m->declare("filters.lib/fir:license", "MIT-style STK-4.3 license");
		m->declare("filters.lib/iir:author", "Julius O. Smith III");
		m->declare("filters.lib/iir:copyright", "Copyright (C) 2003-2019 by Julius O. Smith III <jos@ccrma.stanford.edu>");
		m->declare("filters.lib/iir:license", "MIT-style STK-4.3 license");
		m->declare("filters.lib/lowpass0_highpass1", "Copyright (C) 2003-2019 by Julius O. Smith III <jos@ccrma.stanford.edu>");
		m->declare("filters.lib/name", "Faust Filters Library");
		m->declare("filters.lib/resonbp:author", "Julius O. Smith III");
		m->declare("filters.lib/resonbp:copyright", "Copyright (C) 2003-2019 by Julius O. Smith III <jos@ccrma.stanford.edu>");
		m->declare("filters.lib/resonbp:license", "MIT-style STK-4.3 license");
		m->declare("filters.lib/tf2:author", "Julius O. Smith III");
		m->declare("filters.lib/tf2:copyright", "Copyright (C) 2003-2019 by Julius O. Smith III <jos@ccrma.stanford.edu>");
		m->declare("filters.lib/tf2:license", "MIT-style STK-4.3 license");
		m->declare("filters.lib/tf2s:author", "Julius O. Smith III");
		m->declare("filters.lib/tf2s:copyright", "Copyright (C) 2003-2019 by Julius O. Smith III <jos@ccrma.stanford.edu>");
		m->declare("filters.lib/tf2s:license", "MIT-style STK-4.3 license");
		m->declare("filters.lib/version", "0.3");
		m->declare("license", "MIT");
		m->declare("maths.lib/author", "GRAME");
		m->declare("maths.lib/copyright", "GRAME");
		m->declare("maths.lib/license", "LGPL with exception");
		m->declare("maths.lib/name", "Faust Math Library");
		m->declare("maths.lib/version", "2.5");
		m->declare("name", "ViolinMidi");
		m->declare("physmodels.lib/name", "Faust Physical Models Library");
		m->declare("physmodels.lib/version", "0.1");
		m->declare("platform.lib/name", "Generic Platform Library");
		m->declare("platform.lib/version", "0.3");
		m->declare("routes.lib/name", "Faust Signal Routing Library");
		m->declare("routes.lib/version", "0.2");
		m->declare("signals.lib/name", "Faust Signal Routing Library");
		m->declare("signals.lib/version", "0.3");
	}

	static constexpr int getStaticNumInputs() {
		return 0;
	}
	static constexpr int getStaticNumOutputs() {
		return 1;
	}
	int getNumInputs() {
		return 0;
	}
	int getNumOutputs() {
		return 1;
	}
	
	static void classInit(int sample_rate) {
	}
	
	void instanceConstants(int sample_rate) {
		fSampleRate = sample_rate;
	}
	
	void instanceResetUserInterface() {
	}
	
	void instanceClear() {
		for (int l0 = 0; l0 < 2; l0 = l0 + 1) {
			iRec10[l0] = 0;
		}
		IOTA0 = 0;
		for (int l1 = 0; l1 < 2; l1 = l1 + 1) {
			fRec23[l1] = 0.0f;
		}
		for (int l2 = 0; l2 < 2; l2 = l2 + 1) {
			fRec20[l2] = 0.0f;
		}
		for (int l3 = 0; l3 < 4; l3 = l3 + 1) {
			fRec24[l3] = 0.0f;
		}
		for (int l4 = 0; l4 < 512; l4 = l4 + 1) {
			fRec25[l4] = 0.0f;
		}
		for (int l5 = 0; l5 < 2; l5 = l5 + 1) {
			fVec0[l5] = 0.0f;
		}
		for (int l6 = 0; l6 < 512; l6 = l6 + 1) {
			fVec1[l6] = 0.0f;
		}
		for (int l7 = 0; l7 < 512; l7 = l7 + 1) {
			fRec17[l7] = 0.0f;
		}
		for (int l8 = 0; l8 < 2; l8 = l8 + 1) {
			fRec19[l8] = 0.0f;
		}
		for (int l9 = 0; l9 < 4; l9 = l9 + 1) {
			fRec16[l9] = 0.0f;
		}
		for (int l10 = 0; l10 < 3; l10 = l10 + 1) {
			fRec14[l10] = 0.0f;
		}
		for (int l11 = 0; l11 < 2; l11 = l11 + 1) {
			iRec6[l11] = 0;
		}
		for (int l12 = 0; l12 < 512; l12 = l12 + 1) {
			fRec2[l12] = 0.0f;
		}
		for (int l13 = 0; l13 < 2; l13 = l13 + 1) {
			fRec0[l13] = 0.0f;
		}
	}
	
	void init(int sample_rate) {
		classInit(sample_rate);
		instanceInit(sample_rate);
	}
	void instanceInit(int sample_rate) {
		instanceConstants(sample_rate);
		instanceResetUserInterface();
		instanceClear();
	}
	
	mydsp* clone() {
		return new mydsp();
	}
	
	int getSampleRate() {
		return fSampleRate;
	}
	
	void buildUserInterface(UI* ui_interface) {
		ui_interface->openVerticalBox("ViolinMidi");
		ui_interface->closeBox();
	}
	
	void compute(int count, FAUSTFLOAT** RESTRICT inputs, FAUSTFLOAT** RESTRICT outputs) {
		FAUSTFLOAT* output0 = outputs[0];
		for (int i0 = 0; i0 < count; i0 = i0 + 1) {
			iRec10[0] = 0;
			int iRec11 = iRec10[1];
			float fRec15 = float(iRec6[1]) - 0.98926467f * (0.6f * fRec16[2] + 0.2f * (fRec16[1] + fRec16[3]));
			fRec23[0] = 0.99908125f * fRec23[1] + 0.000643125f;
			float fTemp0 = 31053.176f * (1.0f - fRec23[0]);
			float fTemp1 = fTemp0 + -1.499995f;
			int iTemp2 = int(fTemp1);
			int iTemp3 = int(std::min<float>(423.52942f, float(std::max<int>(0, iTemp2 + 4))));
			float fTemp4 = std::floor(fTemp1);
			float fTemp5 = fTemp0 + (-3.0f - fTemp4);
			float fTemp6 = fTemp0 + (-2.0f - fTemp4);
			float fTemp7 = fTemp0 + (-1.0f - fTemp4);
			float fTemp8 = fTemp7 * fTemp6;
			float fTemp9 = fTemp8 * fTemp5;
			float fTemp10 = fTemp0 + (-4.0f - fTemp4);
			float fTemp11 = 0.0f - fTemp10;
			int iTemp12 = int(std::min<float>(423.52942f, float(std::max<int>(0, iTemp2 + 3))));
			float fTemp13 = 0.0f - 0.5f * fTemp10;
			float fTemp14 = 0.0f - fTemp5;
			int iTemp15 = int(std::min<float>(423.52942f, float(std::max<int>(0, iTemp2 + 2))));
			float fTemp16 = 0.0f - 0.33333334f * fTemp10;
			float fTemp17 = 0.0f - 0.5f * fTemp5;
			float fTemp18 = 0.0f - fTemp6;
			int iTemp19 = int(std::min<float>(423.52942f, float(std::max<int>(0, iTemp2 + 1))));
			float fTemp20 = fTemp0 - fTemp4;
			float fTemp21 = 0.0f - 0.25f * fTemp10;
			float fTemp22 = 0.0f - 0.33333334f * fTemp5;
			float fTemp23 = 0.0f - 0.5f * fTemp6;
			float fTemp24 = 0.0f - fTemp7;
			int iTemp25 = int(std::min<float>(423.52942f, float(std::max<int>(0, iTemp2))));
			fRec20[0] = fRec2[(IOTA0 - (iTemp25 + 1)) & 511] * fTemp24 * fTemp23 * fTemp22 * fTemp21 + fTemp20 * (fRec2[(IOTA0 - (iTemp19 + 1)) & 511] * fTemp18 * fTemp17 * fTemp16 + 0.5f * fTemp7 * fRec2[(IOTA0 - (iTemp15 + 1)) & 511] * fTemp14 * fTemp13 + 0.16666667f * fTemp8 * fRec2[(IOTA0 - (iTemp12 + 1)) & 511] * fTemp11 + 0.041666668f * fTemp9 * fRec2[(IOTA0 - (iTemp3 + 1)) & 511]);
			fRec24[0] = fRec0[1];
			fRec25[IOTA0 & 511] = -1.0f * 0.99880147f * (0.8f * fRec24[2] + 0.1f * (fRec24[1] + fRec24[3]));
			float fTemp26 = 31053.176f * fRec23[0];
			float fTemp27 = fTemp26 + -1.499995f;
			int iTemp28 = int(fTemp27);
			int iTemp29 = int(std::min<float>(423.52942f, float(std::max<int>(0, iTemp28 + 4))));
			float fTemp30 = std::floor(fTemp27);
			float fTemp31 = fTemp26 + (-3.0f - fTemp30);
			float fTemp32 = fTemp26 + (-2.0f - fTemp30);
			float fTemp33 = fTemp26 + (-1.0f - fTemp30);
			float fTemp34 = fTemp33 * fTemp32;
			float fTemp35 = fTemp34 * fTemp31;
			float fTemp36 = fTemp26 + (-4.0f - fTemp30);
			float fTemp37 = 0.0f - fTemp36;
			int iTemp38 = int(std::min<float>(423.52942f, float(std::max<int>(0, iTemp28 + 3))));
			float fTemp39 = 0.0f - 0.5f * fTemp36;
			float fTemp40 = 0.0f - fTemp31;
			int iTemp41 = int(std::min<float>(423.52942f, float(std::max<int>(0, iTemp28 + 2))));
			float fTemp42 = 0.0f - 0.33333334f * fTemp36;
			float fTemp43 = 0.0f - 0.5f * fTemp31;
			float fTemp44 = 0.0f - fTemp32;
			int iTemp45 = int(std::min<float>(423.52942f, float(std::max<int>(0, iTemp28 + 1))));

			float fTemp46 = fTemp26 - fTemp30;
			float fTemp47 = 0.0f - 0.25f * fTemp36;
			float fTemp48 = 0.0f - 0.33333334f * fTemp31;
			float fTemp49 = 0.0f - 0.5f * fTemp32;
			float fTemp50 = 0.0f - fTemp33;
			int iTemp51 = int(std::min<float>(423.52942f, float(std::max<int>(0, iTemp28))));
			fVec0[0] = fRec25[(IOTA0 - (iTemp51 + 2)) & 511] * fTemp50 * fTemp49 * fTemp48 * fTemp47 + fTemp46 * (fRec25[(IOTA0 - (iTemp45 + 2)) & 511] * fTemp44 * fTemp43 * fTemp42 + 0.5f * fTemp33 * fRec25[(IOTA0 - (iTemp41 + 2)) & 511] * fTemp40 * fTemp39 + 0.16666667f * fTemp34 * fRec25[(IOTA0 - (iTemp38 + 2)) & 511] * fTemp37 + 0.041666668f * fTemp35 * fRec25[(IOTA0 - (iTemp29 + 2)) & 511]);
		}
	}

};
#undef private

mydsp dsp;

void OSC_INIT(uint32_t platform, uint32_t api)
{
  (void)platform;
  (void)api;
  //fedisableexcept(fegetexcept());
  dsp.init(k_samplerate);
}

FAUSTFLOAT ynf[64];
void OSC_CYCLE(const user_osc_param_t * const params,
               int32_t *yn,
               const uint32_t frames)
{
  // Update all parameters.
  // The pitchbending code comes from osc_w0f_for_note.
  uint8_t note = params->pitch >> 8;
  uint8_t mod = params->pitch & 0xff;
  float f0 = osc_notehzf(note);
  float f1 = osc_notehzf(note+1);
  float f = clipmaxf(linintf(mod * k_note_mod_fscale, f0, f1), k_note_max_hz);

  set_key(note);
  set_freq(f);
  set_lfo(q31_to_f32(params->shape_lfo));
  set_cutoff((float)params->cutoff / 0x1fff);
  set_resonance((float)params->resonance / 0x1fff);

  // Do the computation on floats, then convert to q31.
  FAUSTFLOAT *inputs[] = {};
  FAUSTFLOAT *outputs[] = {ynf};

  dsp.compute(frames, inputs, outputs);
  for (int i = 0; i < frames; i++)
    yn[i] = f32_to_q31(ynf[i]);
}

void OSC_NOTEON(const user_osc_param_t * const params)
{
  // The API unfortunately doesn't report velocity.
  set_velocity(64);
  set_gain(0.5);
  set_gate(1);
  dsp.instanceClear(); // Makes some sense since the oscillator is monophonic
                       // and is paused when the ADSR envelope is at zero
}

void OSC_NOTEOFF(const user_osc_param_t * const params)
{
  set_velocity(0);
  set_gain(0);
  set_gate(0);
}

void OSC_PARAM(uint16_t index, uint16_t value)
{
  switch (index) {
  case k_user_osc_param_id1:
    set_param1(value);
    break;

  case k_user_osc_param_id2:
    set_param2(value);
    break;

  case k_user_osc_param_id3:
    set_param3(value);
    break;

  case k_user_osc_param_id4:
    set_param4(value);
    break;

  case k_user_osc_param_id5:
    set_param5(value);
    break;

  case k_user_osc_param_id6:
    set_param6(value);
    break;

  case k_user_osc_param_shape:
    set_shape(param_val_to_f32(value) * (SHAPE_MAX - SHAPE_MIN) + SHAPE_MIN);
    break;
    
  case k_user_osc_param_shiftshape:
    set_shiftshape(param_val_to_f32(value) * (SHIFTSHAPE_MAX - SHIFTSHAPE_MIN) + SHIFTSHAPE_MIN);
    break;
  }
}

#endif
