% flanger: Apply a flanging effect to an input audio signal

% Contributors:
% May Zhang
% 

% Documentation:
% signal: The original sound signal on which the flanging effect should be applied. It represents an array of real numbers with length denoted by N.
% time_delay: The maximum amount of time (in seconds) by which the signal is delayed. This helps to control the intensity of the flanging effect.
% osc_freq: The frequency of the cosine function used in the flanger. It controls the speed of the delay oscillation which affects the rate at which the sound is fluctuating.
% amp: The amplitude of the delay signal. It cannot go over 1 as it causes distortion.
% fs: The sampling frequency (samples per second).

% Citations:
% https://users.cs.cf.ac.uk/Dave.Marshall/CM0268/PDF/10_CM0268_Audio_FX.pdf

function y = flanger(signal, time_delay, osc_freq, amp, fs)

    N = length(signal);
    y = zeros(1, N);  % Pre-allocate the output array
    max_delay = floor(time_delay * fs);  % Maximum delay in samples
    delay = floor(max_delay * (1 - cos(2 * pi * osc_freq * (0:N-1) / fs)) / 2);  % Oscillating delay

    for n = max_delay+1 : N
        y(n) = signal(n) + amp * signal(n-delay(n));
    end

    % Normalize the output
    y = y / max(abs(y));

end
