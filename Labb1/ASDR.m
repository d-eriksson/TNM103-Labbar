function [ASDR] = ASDR(AttackTime,SustainTime,DecayTime,ReleaseTime,MaxAmplitude)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
fs=16000;
Time = AttackTime+SustainTime+DecayTime+ReleaseTime;
ASDR = 0:1/fs:Time;
X = 0:1/fs:Time;
ASDR(1,1:AttackTime*fs) = X(1,1:AttackTime*fs).*MaxAmplitude;
ASDR(1, AttackTime*fs:(AttackTime+SustainTime+DecayTime+ReleaseTime)*fs+1) = MaxAmplitude;
ASDR(1, AttackTime*fs:(AttackTime+SustainTime)*fs+1) = MaxAmplitude./X(1, AttackTime*fs:(AttackTime+SustainTime)*fs+1).^3;
ASDR(1,(AttackTime+SustainTime)*fs:(AttackTime+SustainTime+DecayTime+ReleaseTime)*fs+1) = MaxAmplitude./2.^3;
ASDR(1,(AttackTime+SustainTime+DecayTime)*fs:(AttackTime+SustainTime+DecayTime+ReleaseTime)*fs) =ASDR(1,(AttackTime+SustainTime+DecayTime)*fs:(AttackTime+SustainTime+DecayTime+ReleaseTime)*fs)-[0:MaxAmplitude/(ReleaseTime*fs*2^3):MaxAmplitude/2^3];
ASDR = ASDR(1,1:Time*fs);
end

