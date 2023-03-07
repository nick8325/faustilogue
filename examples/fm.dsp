import("stdfaust.lib");
declare version "1.0";
// carrierFreq, modulatorFreq and index definitions go here
carrierFreq=hslider("freq", 2000, 20, 20000, 1);
modulatorFreq=hslider("shape", 1, 0, 1, 0.01)*100;
// index=hslider("param1 [tooltip:Mod index] [scale:percent]", 2, 0, 100, 1);
index=hslider("cutoff [tooltip:Mod index] [scale:percent]", 0.02, 0, 1, 0.01)*100;
lfo=hslider("lfo", 1, -1, 1, 0.0001);
process = 
    os.osc(carrierFreq*index/100+lfo*index)*index;
