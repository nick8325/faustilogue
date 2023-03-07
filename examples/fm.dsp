import("stdfaust.lib");
// carrierFreq, modulatorFreq and index definitions go here
carrierFreq=hslider("freq", 2000, 20, 20000, 1);
modulatorFreq=hslider("shape", 1, 0, 1, 0.01)*100;
index=hslider("param1", 2, 0, 100, 1);
process = 
    os.osc(carrierFreq+os.osc(modulatorFreq)*index);
