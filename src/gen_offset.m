function [t, x, x_phase_offset, x_freq_offset] = gen_offset(f, phase_offset, freq_offset, Fs)
% gen_sine: Returns generate sinusoidal signals with optional phase and frequency offsets

% Contributors:
% Kenneth Casimiro

% Documentation:
% A phase offset changes the position of the waveform relative to its original starting point
% A frequency offset stretches or compresses the waveform along the time axis

% Function Input:
% f: Signal frequency (Hz)
% phase_offset: Phase offset in radians
% freq_offset: Frequency offset in Hz
% Fs: Sampling frequency (Hz)
% Returned Output:
% time vector: t
% original sinusoidal signal: x
% sinusoidal signal w/ phase offset: x_phase_offset
% sinusoidal signal w/ freq offset: x_freq_offset

    % Generate a sinusoidal signal
    t = 0:1/Fs:1-1/Fs;              % Time vector
    x = sin(2*pi*f*t);              % Sinusoidal signal

    % Apply phase offset
    x_phase_offset = sin(2*pi*f*t + phase_offset);

    % Apply frequency offset
    x_freq_offset = sin(2*pi*(f+freq_offset)*t);
end