function delayed_signal = gen_delay(input_signal, Fs, delay_time, feedback_gain)
    % Calculate delay length in samples
    delay_length = round(delay_time * Fs);

    % Initialize delayed signal with zeros
    delayed_signal = zeros(size(input_signal));

    % Apply delay
    for i = 1:length(input_signal)-delay_length
        delayed_signal(i+delay_length) = input_signal(i) + feedback_gain * delayed_signal(i);
    end
end
