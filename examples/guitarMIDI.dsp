declare name "GuitarMidi";
declare description "Simple acoustic guitar model with steel strings.";
declare license "MIT";
declare copyright "(c)Romain Michon, CCRMA (Stanford University), GRAME";

import("stdfaust.lib");

process = guitar_ui_MIDI <: _;

guitar_ui_MIDI = pm.guitar(stringLength,pluckPosition,gain,gate)
with{
    f = hslider("freq",440,50,1000,0.01);
    bend = ba.semi2ratio(hslider("lfo",0,-1,1,0.01)*2) : si.polySmooth(gate,0.999,1);
    gain = hslider("shiftshape",0.8,0,1,0.01);
    pluckPosition = hslider("shape" ,0.8,0,1,0.01) : si.smoo;
    gate = 1;
    freq = f*bend;
    stringLength = freq : pm.f2l;
};
