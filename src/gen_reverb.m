function reverberated_signal = gen_reverb(original_signal, fs, reverb_time, initial_gain, room_size)
    % Ensure mono signal input
    if size(original_signal, 2) > 1
        original_signal = mean(original_signal, 2); % Convert to mono if not already
    end

    % Basic reverb parameters
    num_delays = 4; % Number of delay lines for simplicity
    delay_times_ms = [30, 37, 43, 47]; % Delay times in milliseconds, prime numbers for less periodicity
    decay_factors = [0.5, 0.4, 0.3, 0.25]; % Decay factors for each delay line

    % Adjust decay_factors based on reverb_time and room_size
    decay_factors = decay_factors * reverb_time * (0.5 + room_size);

    % Convert delay times from milliseconds to samples
    delay_samples = round(delay_times_ms * fs / 1000);

    % Preallocate the delayed signals array
    delayed_signals = zeros(length(original_signal) + max(delay_samples), num_delays);

    % Generate delayed signals
    for i = 1:num_delays
        delay = delay_samples(i);
        decay = decay_factors(i);

        % Apply delay and decay
        for n = 1+delay:length(original_signal)
            delayed_signals(n, i) = original_signal(n-delay) * decay;
        end
    end

    % Sum the delayed signals and apply initial gain
    summed_delays = sum(delayed_signals, 2) * initial_gain;

    % Mix the original signal with the reverberated signal
    reverberated_signal = [original_signal; zeros(max(delay_samples), 1)] + summed_delays;

    % Trim the reverberated signal to the original length
    reverberated_signal = reverberated_signal(1:length(original_signal));
end