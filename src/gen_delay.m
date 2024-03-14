function delayed_signal = gen_delay(input_signal, Fs, delay_time, feedback_gain)
% gen_delay: Generates a delayed version of the input signal with optional feedback

% Contributors:
% Kenneth Casimiro

% Documentation:
% This function generates a delayed version of the input signal with an optional feedback loop.
% Delayed signals are often used in audio processing to create effects like echo or reverb.
% The feedback_gain parameter controls the strength of the feedback loop, affecting the decay
% or amplification of the delayed signal over time.

% Function Input:
% input_signal: Input signal to be delayed
% Fs: Sampling frequency (Hz)
% delay_time: Delay time in seconds
% feedback_gain: Gain applied to the delayed signal for feedback

% Returned Output:
% delayed_signal: Signal delayed by the specified delay_time with optional feedback

% Example usage:
% delayed_signal = gen_delay(input_signal, Fs, delay_time, feedback_gain);
    % Calculate delay length in samples
    delay_length = round(delay_time * Fs);

    % Initialize delayed signal with zeros
    delayed_signal = zeros(size(input_signal));

    % Apply delay
    for i = 1:length(input_signal)-delay_length
        delayed_signal(i+delay_length) = input_signal(i) + feedback_gain * delayed_signal(i);
    end
end
