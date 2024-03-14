function [output] = audio_fade_out(input,fade_duration)
%Input: an audio wave file and a fade duration (should be greater than 1
%and less than the length of audio wave. 

%Output: the audio signal with a fade out effect applied to the end.

%Load audio file
[output, freq] = audioread(input); 

%Check fade duration for user error. If fade duration is less than 1, we
%round it to 1. If it is greater than the audio length, we set it to the
%audio length. 
fade_duration = round(fade_duration);

if fade_duration < 1
    fade_duration = 1;
elseif fade_duration > length(output)
    fade_duration = length(output); 
end 

%Set the fade in by scaling the amplitude with values from 1 to 0 (opposite of what
% we did for fade in, slowly decreasing the amplitude for the fade-out effect. 
samples = round(fade_duration * freq); 
fade_out = (fade_samples:-1:1) / samples; 

%Apply the fade-in effect to the audio signal. 
output(end-samples+1:end) = output(end-samples+1:end) .* fade_out;


