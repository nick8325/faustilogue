import("stdfaust.lib");
// freq, res and gate definitions go here
freq = hslider("freq", 2000, 1, 22000, 1);
res = hslider("shape", 1.2, 0, 5, 0.01);
gate = 1;
string(frequency,resonance,trigger) = trigger : ba.impulsify : fi.fb_fcomb(1024,del,1,resonance)
with {
    del = ma.SR/frequency;
};
process = string(freq,res,gate);
