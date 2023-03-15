declare name "GuitarMidi";
declare description "Simple acoustic guitar model with steel strings.";
declare license "MIT";
declare copyright "(c)Romain Michon, CCRMA (Stanford University), GRAME";

import("stdfaust.lib");

process = guitar_ui_MIDI <: _;

guitar_ui_MIDI = guitar(stringLength,pluckPosition,gain,gate)
with{
    f = hslider("freq",440,50,1000,0.01);
    bend = ba.semi2ratio(hslider("lfo",0,-1,1,0.01)*2) : si.polySmooth(gate,0.999,1);
    gain = hslider("shiftshape",0.8,0,1,0.01);
    pluckPosition = hslider("shape" ,0.8,0,1,0.01) : si.smoo;
    gate = 1;
    freq = f*bend;
    stringLength = freq : pm.f2l;
};

//-------`(pm.)guitarModel`----------
// A simple acoustic guitar model with steel strings and selectable excitation
// position. This model implements a single string. Additional strings should be created
// by making a polyphonic application out of this function. Pitch is changed by
// changing the length of the string and not through a finger model.
// WARNING: this function doesn't currently implement a body (just strings and
// bridge).
//
// #### Usage
//
// ```
// guitarModel(length,pluckPosition,excitation) : _
// ```
//
// Where:
//
// * `length`: the length of the string in meters
// * `pluckPosition`: pluck position (0-1) (1 is on the bridge)
// * `excitation`: excitation signal
//----------------------------------
guitarModel(length,pluckPosition,excitation) = pm.endChain(egChain)
with{
    maxStringLength = maxLength;
    lengthTuning = 0.22; // tuned "by hand"
    stringL = length-lengthTuning;
    egChain = pm.chain(pm.guitarNuts : pm.steelString(stringL,pluckPosition,excitation) :
    pm.guitarBridge : pm.guitarBody : pm.out);
};

//-------`(pm.)guitar`----------
// A simple acoustic guitar model with steel strings (based on
// [`guitarModel`](#guitarmodel)) implementing an excitation model.
// This model implements a single string. Additional strings should be created
// by making a polyphonic application out of this function.
//
// #### Usage
//
// ```
// guitar(length,pluckPosition,trigger) : _
// ```
//
// Where:
//
// * `length`: the length of the string in meters
// * `pluckPosition`: pluck position (0-1) (1 is on the bridge)
// * `gain`: gain of the excitation
// * `trigger`: trigger signal (1 for on, 0 for off)
//----------------------------------
guitar(stringLength,pluckPosition,gain,trigger) =
pm.pluckString(stringLength,1,1.5,1,gain,trigger) : guitarModel(stringLength, pluckPosition);
