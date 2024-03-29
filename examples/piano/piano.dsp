// WARNING: this model doesn't work very well on the Minilogue XD!

declare name "piano";
declare description "WaveGuide Commuted Piano";
declare author "Romain Michon (rmichon@ccrma.stanford.edu)";
declare copyright "Romain Michon";
declare version "1.0";
declare licence "STK-4.3"; // Synthesis Tool Kit 4.3 (MIT style license);
declare description "A commuted WaveGuide piano."; 

import("instruments.lib");

//==================== GUI SPECIFICATION ================

freq = nentry("h:Basic_Parameters/freq [1][unit:Hz] [tooltip:Tone frequency]",440,20,20000,1);
freqn = nentry("h:Basic_Parameters/key",69,0,125,1);
gain = nentry("h:Basic_Parameters/gain [1][tooltip:Gain (value between 0 and 1)]",1,0,1,0.01); 
gate = button("h:Basic_Parameters/gate [1][tooltip:noteOn = 1, noteOff = 0]");

brightnessFactor = hslider("v:Physical_Parameters/shape [2][tooltip:A value between 0 and 1]",0,0,1,0.01);
detuningFactor = hslider("v:Physical_Parameters/shiftshape [2][tooltip:A value between 0 and 1]",0.1,0,1,0.01)*10;
stiffnessFactor = hslider("v:Physical_Parameters/param1 [2][tooltip:Stiffness] [style:percentage]",28,0,100,1)*0.01*3.7;
hammerHardness = hslider("v:Physical_Parameters/param2 [2][tooltip:Hardness, style:percentage]",10,0,100,1)*0.001;

//==================== COMMUTED PIANO PARAMETERS ================

//variables to set keybord splitting zone
DCB2_TURNOFF_KEYNUM = 92;
FIRST_HIGH_NOTE = 88;
PEDAL_ENVELOPE_T60 = 7;

//convert an amplitude in db
dbinv(x) = pow(10,0.05*x);

//a counter that restart a every note-on
cntSample = *(gate)+1~_ : -(1);

//==================== PIANO SOUND BOARD ================

//exponential envelope with 3 phases for the pedal excitation	
asympT60pedal(value,T60) = (*(factor) + constant)~_
	with{
		attDur = hammerHardness*float(ma.SR);
		target = value*((cntSample < attDur) & (gate > 0));
		factorAtt = exp (-1/(attDur)); 
		factorG = exp(-1/(2*float(ma.SR)));
		factorT60 = exp(-7/(T60*float(ma.SR)));
		factor = factorAtt*gate*(cntSample < attDur) + (cntSample >= attDur)*gate*factorG + ((gate-1)*-1)*factorT60;
		constant = (1 - factor)*target;			
	};

//the sound of the piano sound board is generated by noise generator whose output gain is shaped by
//an exponential envelope
soundBoard = dryTapAmp*no.noise + pedalEnv*no.noise : *(0.5)
	with{
		//the values of the envelope cut-off time are stored in an external C++ function 
		dryTapAmpT60 = ffunction(float getValueDryTapAmpT60(float), <piano.h>,"");
		sustainPedalLevel = ffunction(float getValueSustainPedalLevel(float), <piano.h>,"");

		pedalEnvCutOffTime = 1.4;
		noteCutOffTime = freqn : dryTapAmpT60*gain;
		pedalEnvValue = freqn : sustainPedalLevel*0.2;
		noteEnvValue = 0.15;
		dryTapAmp = asympT60(noteEnvValue,0,noteCutOffTime,gate);
		pedalEnv = asympT60pedal(pedalEnvValue,pedalEnvCutOffTime);
	};	

//==================== HAMMER MODELING ================

//To model the exitation hammer, we filter the sound from the soundboard with a serie of 4 one pole filters
//connected in serie  

//onePole is declared in instruments.lib
calcHammer = onePole((1-hammerPole)*hammerGain,-hammerPole)
	with{
		//filter gains and coefficients are stored in external C++ files
		loudPole = ffunction(float getValueLoudPole(float), <piano.h>,"");
		softPole = ffunction(float getValuePoleValue(float), <piano.h>,"");
		loudGain = ffunction(float getValueLoudGain(float), <piano.h>,"");
		softGain = ffunction(float getValueSoftGain(float), <piano.h>,"");

		loudPoleValue = loudPole(freqn) + (brightnessFactor*-0.25) + 0.02;	
		softPoleValue = softPole(freqn);
		normalizedVelocityValue = 1;
		loudGainValue = loudGain(freqn);
		softGainValue = softGain(freqn);
		overallGain = 1;
		hammerPole = softPoleValue + (loudPoleValue - softPoleValue)*normalizedVelocityValue;
		hammerGain = overallGain*(softGainValue + (loudGainValue - softGainValue)*normalizedVelocityValue);
	};

hammer = seq(i,4,calcHammer);

//==================== DC BLOCKERS ================

//the values for the dcblockers a1 are stored in an external C++ file
DCBa1 = ffunction(float getValueDCBa1(float), <piano.h>,"");
dCBa1Value = freqn : DCBa1;
dCBb0Value = 1 - dCBa1Value;

dcBlock1 = poleZero((dCBb0Value*0.5),(dCBb0Value*-0.5),dCBa1Value);

dcBlock2a = oneZero1(0.5,-0.5);
	
dcBlock2b = onePole(dCBb0Value,dCBa1Value);

//==================== HIGH TUNING CALCULATION ================

//high tones are not generated with the waveguide technique but with a serie of biquad filters

r1_1 = ffunction(float getValuer1_1db(float), <piano.h>,"");
r1_2 = ffunction(float getValuer1_2db(float), <piano.h>,"");
r2 = ffunction(float getValuer2db(float), <piano.h>,"");
r3 = ffunction(float getValuer3db(float), <piano.h>,"");
e = ffunction(float getValueSecondStageAmpRatio(float), <piano.h>,"");
second_partial_factor = ffunction(float getValueSecondPartialFactor(float), <piano.h>,"");
third_partial_factor = ffunction(float getValueThirdPartialFactor(float), <piano.h>,"");
bq4_gEarBalled = ffunction(float getValueBq4_gEarBalled(float), <piano.h>,"");

r1_1Value = r1_1(freqn)/ma.SR : dbinv;
r1_2Value = r1_2(freqn)/ma.SR : dbinv;
r2Value = r2(freqn)/ma.SR : dbinv;
r3Value = r3(freqn)/ma.SR : dbinv;
eValue = e(freqn) : dbinv;
second_partial_factorValue = second_partial_factor(freqn); 
third_partial_factorValue = third_partial_factor(freqn);

//set biquad gains and coeffs
gainHighBq(0) = bq4_gEarBalled(freqn)/0.5;
gainHighBq(1) = bq4_gEarBalled(freqn)/0.5;
gainHighBq(2) = 1;
gainHighBq(3) = 1;

b0HighBq(0) = 1;
b0HighBq(1) = 1;
b0HighBq(2) = 1;
b0HighBq(3) = 1;

b1HighBq(0) = 0;
b1HighBq(1) = 0;
b1HighBq(2) = -2*(eValue*r1_1Value+(1-eValue)*r1_2Value)*cos(2*ma.PI*freq/ma.SR);
b1HighBq(3) = 0;

b2HighBq(0) = 0;
b2HighBq(1) = 0;
b2HighBq(2) = eValue*r1_1Value*r1_1Value+(1-eValue)*r1_2Value*r1_2Value;
b2HighBq(3) = 0;

a1HighBq(0) = -2*r3Value*cos(2*ma.PI*freq*third_partial_factorValue/ma.SR);
a1HighBq(1) = -2*r2Value*cos(2*ma.PI*freq*second_partial_factorValue/ma.SR);
a1HighBq(2) = -2*r1_1Value*cos(2*ma.PI*freq/ma.SR);
a1HighBq(3) = -2*r1_2Value*cos(2*ma.PI*freq/ma.SR);

a2HighBq(0) = r3Value*r3Value;
a2HighBq(1) = r2Value*r2Value;
a2HighBq(2) = r1_1Value*r1_1Value;
a2HighBq(3) = r1_2Value*r1_2Value;

highBqs = seq(i,4,*(gainHighBq(i)) : fi.TF2(b0HighBq(i),b1HighBq(i),b2HighBq(i),a1HighBq(i),a2HighBq(i)));

hiPass = oneZero1(b0,b1)
	with{
		b0 = -0.5;
		b1 = -0.5;
	};

//==================== STRIKE POSITION COMB FILTER EQ ================

eq = _*filterGain : fi.TF2(b0,b1,b2,a1,a2)
	with{
		strikePosition = ffunction(float getValueStrikePosition(float), <piano.h>,"");
		bandwidthFactors = ffunction(float getValueEQBandWidthFactor(float), <piano.h>,"");
		eq_gain = ffunction(float getValueEQGain(float), <piano.h>,"");
		eq_tuning = freq/strikePosition(freqn);
		eq_bandwidth = bandwidthFactors(freqn)*freq;
		filterGain = eq_gain(freqn);
		a2 = (eq_bandwidth / ma.SR) * (eq_bandwidth / ma.SR);
		a1 = -2*(eq_bandwidth / ma.SR)*cos(2*ma.PI*eq_tuning/ma.SR);
		b0 = 0.5 - 0.5 * a2;
		b1 = 0;
		b2 = -b0;	
	};
	
//==================== PIANO COUPLED STRINGS ================

//values for the couple strings are stored in externals C++ functions
singleStringDecRate = ffunction(float getValueSingleStringDecayRate(float), <piano.h>,"");
singleStringZero = ffunction(float getValueSingleStringZero(float), <piano.h>,"");
singleStringPole = ffunction(float getValueSingleStringPole(float), <piano.h>,"");
stiffnessCoefficient = ffunction(float getValueStiffnessCoefficient(float), <piano.h>,"");

//coupling filter parameters
g = pow(10,((singleStringDecRate(freqn)/freq)/20)); //attenuation per period
b = singleStringZero(freqn);
a = singleStringPole(freqn);
tempd = 3*(1-b)-g*(1-a);
b0Coupling = 2*(g*(1-a)-(1-b))/tempd;
b1Coupling = 2*(a*(1-b)-g*(1-a)*b)/tempd;
a1Coupling = (g*(1-a)*b - 3*a*(1-b))/tempd;

//string stiffness
stiffness = stiffnessFactor*stiffnessCoefficient(freqn);

stiffnessAP = poleZero(b0s,b1s,a1s) 
	with{
		b0s = stiffness;
		b1s = 1;
		a1s = stiffness;
	};
	
delayG(frequency,stiffnessCoefficient) = de.fdelay(1024,delayLength)
	with{
		allPassPhase(a1,WT) = atan2((a1*a1-1.0)*sin(WT),(2.0*a1+(a1*a1+1.0)*cos(WT)));
		poleZeroPhase(b0,b1,a1,WT) = atan2(-b1*sin(WT)*(1 + a1*cos(WT)) + a1*sin(WT)*(b0 + b1*cos(WT)),
						   (b0 + b1*cos(WT))*(1 + a1*cos(WT)) + b1*sin(WT)*a1*sin(WT));
		wT = frequency*2*ma.PI/ma.SR;
		delayLength = (2*ma.PI + 3*allPassPhase(stiffnessCoefficient, wT) +
						poleZeroPhase((1+2*b0Coupling),
						a1Coupling + 2*b1Coupling, a1Coupling, wT)) / wT;	
	};
		
coupledStrings = (parallelStrings <: (_,(_+_ <: _,_),_ : _,_,(_ : couplingFilter),_ : adder))~(_,_) : !,!,_
	with{
		releaseLoopGain = ffunction(float getValueReleaseLoopGain(float), <piano.h>,"");
		hz = ffunction(float getValueDetuningHz(float), <piano.h>,"");
		coupledStringLoopGain = gate*0.9996 + ((gate-1)*-1)*releaseLoopGain(freqn)*0.9 : si.smoo;
		couplingFilter = poleZero(b0Coupling,b1Coupling,a1Coupling);
		hzValue = hz(freqn);
		freq1 = freq + 0.5*hzValue*detuningFactor;
		freq2 = freq - 0.5*hzValue*detuningFactor;
		delay1 = delayG(freq1,stiffness);
		delay2 = delayG(freq2,stiffness);
		parallelStrings(x,y) = _ <: (+(x)*coupledStringLoopGain : seq(i,3,stiffnessAP) : delay1),
				(_+y*coupledStringLoopGain : seq(i,3,stiffnessAP) : delay2);
		adder(w,x,y,z) = (y <: +(w),+(z)),x ;	
	};

//stereoizer is declared in instruments.lib and implement a stereo spacialisation in function of 
//the frequency period in number of samples 
stereo = stereoizer(ma.SR/freq);

//==================== PROCESSING ================

conditionLowNote = freqn < FIRST_HIGH_NOTE;
conditionHighNote = freqn >= FIRST_HIGH_NOTE;

process = soundBoard <: (*(conditionLowNote)*6 : hammer : dcBlock1 : coupledStrings <: +(eq)),
(*(conditionHighNote) : hiPass : dcBlock1 : hammer : dcBlock2a : highBqs : dcBlock2b) :> + : *(12);

