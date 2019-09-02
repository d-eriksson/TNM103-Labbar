function [Oscillator, fs] = SawOscillator(T,freq,width)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
fs = 16000;
t = 0:1/fs:T-1/fs;
Oscillator = sawtooth(2*pi*freq*t, width);
end

