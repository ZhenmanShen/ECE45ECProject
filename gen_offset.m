function [t, x, x_phase_offset, x_freq_offset] = gen_offset(f, phase_offset, freq_offset, Fs)
    % Generate a sinusoidal signal
    t = 0:1/Fs:1-1/Fs;              % Time vector
    x = sin(2*pi*f*t);              % Sinusoidal signal

    % Apply phase offset
    x_phase_offset = sin(2*pi*f*t + phase_offset);

    % Apply frequency offset
    x_freq_offset = sin(2*pi*(f+freq_offset)*t);
end