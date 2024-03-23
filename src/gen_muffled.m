% gen_muffled: Output a muffled signal compared to original input signal
% sound is in time domain, appears as if the signal is distant for listener
% Contributors:
% Eric Palafox
% DOCUMENTATION
% signal:
% fs:

function modified_signal = gen_muffled(signal, fs)
    % Check if the signal is stereo
    if size(signal, 2) > 1
        % If stereo, convert to mono by averaging the channels
        signal = mean(signal, 2);
    end
    
    % Create a low-pass filter to muffle the signal
    cutoff_frequency = 1000; % Adjust cutoff frequency as needed
    filter_order = 4; % Adjust filter order as needed
    nyquist_freq = fs / 2;
    cutoff_ratio = cutoff_frequency / nyquist_freq;
    [b, a] = butter(filter_order, cutoff_ratio, 'low');
    
    % Apply the filter to the signal
    modified_signal = filter(b, a, signal);
end

