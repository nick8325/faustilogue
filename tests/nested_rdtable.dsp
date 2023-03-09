import("stdfaust.lib");

tablesize = pl.tablesize;
phasor = os.phasor;

mything1 = os.oscsin(440);
mything2 = os.osccos(220);
process = rdtable(pl.tablesize, mything1 + mything2, int(os.phasor(pl.tablesize, 1)));
