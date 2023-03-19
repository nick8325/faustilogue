declare name "KarplusStrong";
declare description "Simple call of the Karplus-Strong model for the Faust physical modeling library";
declare license "MIT";
declare copyright "(c)Romain Michon, CCRMA (Stanford University), GRAME";

import("stdfaust.lib");

process = 1 : pm.impulseExcitation*gain : pm.ks( (freq : pm.f2l), damping )
with{
    freq = hslider("freq",440,50,1000,0.01);
    gain = hslider("shape",0.8,0,1,0.01);
    damping = hslider("shiftshape" ,0.01,0,1,0.01) : si.smoo;
};
