%% Create Oscillator
Time = 4;
frequency = 220;
[Oscillator1,fs] = SawOscillator(Time,frequency,0.5);
[Oscillator2] = SawOscillator(Time,frequency-1,0.5);
[Oscillator3] = SawOscillator(Time,frequency/2,0.1);

[Comb1_2] = CombineOscillator(Oscillator1,Oscillator2,0.5);
[MoogSound] = CombineOscillator(Comb1_2,Oscillator3,0.5);

p=audioplayer(MoogSound, fs);
playblocking(p);

%% Filter sounds
CutoffFreq = 2200;
Wn = CutoffFreq/(fs*0.5);
[b,a] = butter(4,Wn);
FilteredSound = filter(b,a,MoogSound);
%freqz(b, a);
%figure();
%spectrogram(FilteredSound, 512, 256, 512, fs, 'yaxis');
%ylim([0,2]);
%title('Spektrogram av ljudet');
%xlabel('Tid (s)');
%ylabel('Frekvens (kHz)');
p=audioplayer(FilteredSound, fs);
playblocking(p);

%%
clear ASDR
AttackTime = Time/2;
SustainTime = Time/6;
DecayTime = Time/6;
ReleaseTime =Time/6;
MaxAmplitude =1;
ASDR = ASDR(AttackTime,SustainTime,DecayTime,ReleaseTime,MaxAmplitude);
%FilteredSound = FilteredSound.*ASDR;
plot(FilteredSound)
p=audioplayer(FilteredSound, fs);
playblocking(p);
