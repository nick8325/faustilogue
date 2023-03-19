declare name "harpsi";
declare description "Nonlinear WaveGuide Commuted Harpsichord";
declare author "Romain Michon (rmichon@ccrma.stanford.edu)";
declare copyright "Romain Michon";
declare version "1.0";
declare licence "STK-4.3"; // Synthesis Tool Kit 4.3 (MIT style license);
declare description "A commuted WaveGuide Harpsichord."; 

import("instruments.lib");

//==================== GUI SPECIFICATION ================

freq = nentry("freq",440,20,20000,1);
gain = nentry("gain",0.8,0,1,0.01); 
gate = button("gate");

typeModulation = nentry("param1 [tooltip: Mod type]", 1, 1, 5, 1) - 1;
nonLinearity = hslider("shape",0,0,1,0.01);
frequencyMod = hslider("shiftshape",220,20,1000,0.1);

//==================== PROCESSING ================

//----------------------- Nonlinear filter ----------------------------
//nonlinearities are created by the nonlinear passive allpass ladder filter declared in miscfilter.lib

//nonlinear filter order
nlfOrder = 6; 

//nonLinearModultor is declared in instruments.lib, it adapts allpassnn from miscfilter.lib 
//for using it with waveguide instruments
NLFM =  nonLinearModulator((nonLinearity : si.smoo),1,freq,
     typeModulation,(frequencyMod : si.smoo),nlfOrder);

//----------------------- Synthesis parameters computing and functions declaration ----------------------------

//convert a frequency in a midi note number
freqToNoteNumber = (log-log(440))/log(2)*12+69+0.5 : int;
freqn = freq : freqToNoteNumber;

//string excitation
soundBoard = dryTapAmp*no.noise
	with{
		dryTapAmpT60 = ffunction(float getValueDryTapAmpT60(float), <harpsichord.h>,"");
		noteCutOffTime = freqn : dryTapAmpT60*gain;
		dryTapAmp = asympT60(0.15,0,noteCutOffTime,gate);
	};	

//loopfilter is a biquad filter whose coefficients are extracted from a C++ file using the foreign function mechanism
loopFilter = fi.TF2(b0,b1,b2,a1,a2)
	   with{
		//functions are imported from the C++ file
		loopFilterb0 = ffunction(float getValueLoopFilterb0(float), <harpsichord.h>,"");
		loopFilterb1 = ffunction(float getValueLoopFilterb1(float), <harpsichord.h>,"");
		loopFilterb2 = ffunction(float getValueLoopFilterb2(float), <harpsichord.h>,"");
		loopFiltera1 = ffunction(float getValueLoopFiltera1(float), <harpsichord.h>,"");
		loopFiltera2 = ffunction(float getValueLoopFiltera2(float), <harpsichord.h>,"");
		//coefficients are extracted from the functions
		b0 = loopFilterb0(freqn);
		b1 = loopFilterb1(freqn);
		b2 = loopFilterb2(freqn);
		a1 = loopFiltera1(freqn);
		a2 = loopFiltera2(freqn);
	   };

//delay length as a number of samples
delayLength = ma.SR/freq;

//----------------------- Algorithm implementation ----------------------------

//envelope for string loop resonance time
stringLoopGainT = gate*0.9996 + (gate<1)*releaseLoopGain(freqn)*0.9 : si.smoo
		with{
			releaseLoopGain = ffunction(float getValueReleaseLoopGain(float), <harpsichord.h>,"");
		};

//one string
string = (*(stringLoopGainT)+_ : de.delay(4096,delayLength) : loopFilter)~NLFM;

process = soundBoard : string;
