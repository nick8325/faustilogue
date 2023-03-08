declare name "ViolinMidi";
declare description "Simple MIDI-controllable violin physical model.";
declare license "MIT";
declare copyright "(c)Romain Michon, CCRMA (Stanford University), GRAME";

import("stdfaust.lib");

//-------`(pm.)violin_ui_MIDI`----------
// Ready-to-use MIDI-enabled violin physical model with built-in UI.
//
// #### Usage
//
// ```
// violin_ui_MIDI : _
// ```
//----------------------------------
violin_ui_MIDI = pm.violinModel(stringLength,bowPress,bowVel,bowPos)
with{
    f = hslider("freq",440,50,1000,0.01);
	gain = hslider("param2 [tooltip:Gain] [style:percentage]",60,1,100,1)*0.01;
    envAttack = hslider("shiftshape",1,0.1,30,0.01)*0.001;
    bowPress = hslider("shape",0.5,0.01,1,0.01) : si.smoo;
	bowPos = hslider("param1 [tooltip: Bow posn] [style:percentage]",70,1,100,1)*0.01 : si.smoo;

    vibrato = 1+hslider("lfo", 0, -1, 1, 0.001)*0.9*envelope;
    freq = f*vibrato;
    envelope = gain : si.smooth(ba.tau2pole(envAttack));

    stringLength = freq : pm.f2l;
    bowVel = envelope;
};

process = violin_ui_MIDI : _;
