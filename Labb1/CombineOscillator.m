function [oscillator] = CombineOscillator(os1,os2, scale)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

oscillator = (scale.*os1 + (1-scale).*os2);
end

