import("all.lib");

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Simple FM synthesizer.
// 2 oscillators and FM feedback on modulant oscillator
//
///////////////////////////////////////////////////////////////////////////////////////////////////
// MIDI IMPLEMENTATION:
//
// CC 1 : FM feedback on modulant oscillator.
// CC 14 : Modulator frequency ratio.
//
// CC 73 : Attack
// CC 76 : Decay
// CC 77 : Sustain
// CC 72 : Release
//
///////////////////////////////////////////////////////////////////////////////////////////////////

// GENERAL, Keyboard
midigate = button("gate");
midifreq = nentry("freq[unit:Hz]", 440, 20, 20000, 1);
midigain = nentry("gain", 1, 0, 1, 0.01);

// modwheel:
feedb = (midifreq-1) * (hslider("shiftshape [midi:ctrl 1]", 0, 0, 1, 0.001) : si.smoo);
modFreqRatio = hslider("shape [midi:ctrl 14]",2,0,20,0.01) : si.smoo;

//=================================== Parameters Mapping =================================
//========================================================================================
// Same for volum & modulation:
volA = hslider("param1 [tooltip: A] [midi:ctrl 73]",1,1,100,1)/25;
volD = hslider("param2 [tooltip: D] [midi:ctrl 76]",60,1,100,1)/12.5;
volS = hslider("param3 [tooltip: S] [midi:ctrl 77] [style:percentage]",20,0,100,1)*0.01;
volR = hslider("param4 [tooltip: R] [midi:ctrl 72]",80,1,100,1)/12.5;
envelop = en.adsre(volA,volD,volS,volR,midigate);

// modulator frequency
modFreq = midifreq*modFreqRatio;

// modulation index
lfo = (hslider("lfo [midi:pitchwheel]",0,-1,1,0.01));
FMdepth = envelop * 1000 * midigain * (1+lfo);

// Out amplitude
vol = envelop;

//============================================ DSP =======================================
//========================================================================================

FMfeedback(frq) = (+(_,frq):os.osci) ~ (*(feedb));
FMall(f) = os.osci(f + (FMdepth*FMfeedback(f*modFreqRatio)));

process = FMall(midifreq);
