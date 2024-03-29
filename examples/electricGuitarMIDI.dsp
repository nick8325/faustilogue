// NOTE: this only works at 24kHz
// TODO: retune it to sound nice at 24kHz!

declare name "ElecGuitarMidi";
declare description "Simple electric guitar model.";
declare license "MIT";
declare copyright "(c)Romain Michon, CCRMA (Stanford University), GRAME";

import("stdfaust.lib");

process = guitar_ui_MIDI;

guitar_ui_MIDI = pm.elecGuitar(stringLength,pluckPosition,1,gain,gate)
with{
    f = hslider("freq",440,50,1000,0.01);
    bend = ba.semi2ratio(hslider("lfo",0,-1,1,0.01)*2) : si.polySmooth(gate,0.999,1);
    gain = hslider("shiftshape",0.8,0,1,0.01);
    pluckPosition = hslider("shape" ,0.8,0,1,0.01) : si.smoo;
    gate = 1;
    freq = f*bend;
    stringLength = freq : pm.f2l;
};
