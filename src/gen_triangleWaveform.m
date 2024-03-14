% gen_triangleWaveform: Returns a matrix of sampled (fs) sine wave

% Contributors:
% yanhua liu

% Documentation:
% amp: Do not go over 1, as it distorts
% freq: frequency desired for wave
% phase: number of periods (x * (1/freq)), where (-1 < x < 1)
% fs: sampling frequency, digitizes wave
% dur: time in seconds
% duty: N/A for Sine

function triangleWaveform = gen_triangleWaveform(amp, freq, phase, fs, dur, duty)
    % Generate time vector
    t = linspace(0, dur, dur * fs);
    
    % Generate the triangle waveform using a piecewise function
    triangleWaveform = 4 * abs(mod(t * freq + phase, 1) - 0.5) - 1;
end
