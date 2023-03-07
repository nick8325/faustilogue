import("stdfaust.lib");
// carrierFreq, modulatorFreq and index definitions go here
carrierFreq=2000;
modulatorFreq=50;
index=2;
process = 
    os.osc(carrierFreq+os.osc(modulatorFreq)*index);
