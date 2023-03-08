import("stdfaust.lib");
declare version "1.0";
// carrierFreq, modulatorFreq and index definitions go here
carrierFreq=hslider("freq", 2000, 20, 20000, 1);
modulatorFreq=hslider("shape", 1, 0, 200, 20);
index=hslider("param1 [tooltip:Mod index]", 2, 0, 100, 1);
lfo=hslider("lfo", 1, -1, 1, 0.0001);
process = 
    os.osc(carrierFreq + (lfo + os.osc(modulatorFreq))*index);
