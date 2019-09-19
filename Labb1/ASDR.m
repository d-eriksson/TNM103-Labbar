function [ASDR] = ASDR(AttackTime,DecayTime,SustainTime,ReleaseTime,MaxAmplitude,SustainAmplitude)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
fs=16000;
Time = AttackTime+SustainTime+DecayTime+ReleaseTime;
ASDR = 0:1/fs:Time-1/fs;
X = 0:1/fs:Time-1/fs;

da = MaxAmplitude/AttackTime;
ASDR(1,1:AttackTime*fs) = X(1,1:AttackTime*fs).*da;

kd = (MaxAmplitude-SustainAmplitude)/(-DecayTime);
md = MaxAmplitude - dd*AttackTime;
ASDR(1,AttackTime*fs:(AttackTime+DecayTime)*fs) = md+kd.*X(1,AttackTime*fs:(AttackTime+DecayTime)*fs);

ASDR(1,(AttackTime+DecayTime)*fs:(AttackTime+DecayTime+SustainTime)*fs) = SustainAmplitude;
dr = (SustainAmplitude)/(-ReleaseTime);
kr = -dr*(Time-1/fs);

ASDR(1,(AttackTime+DecayTime+SustainTime)*fs:(Time)*fs) = kr+dr.*X(1,(AttackTime+DecayTime+SustainTime)*fs:(Time)*fs);

end

