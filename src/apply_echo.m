function output_signal = apply_echo(input_signal, Fs, delay_seconds, decay_factor)
    % Convert delay from seconds to samples
    delay_samples = round(delay_seconds * Fs);
    
    % Pad the input signal with zeros to accommodate the delay
    padded_input = [input_signal; zeros(delay_samples, size(input_signal, 2))];
    
    % Create an array to store the output signal
    output_signal = zeros(size(padded_input));
    
    % Apply echo effect
    for i = 1:size(input_signal, 1)
        output_signal(i:i+delay_samples-1,:) = output_signal(i:i+delay_samples-1,:) + ...
                                                decay_factor * padded_input(i:i+delay_samples-1,:);
    end
    
    % Normalize the output signal to prevent clipping
    output_signal = output_signal / max(abs(output_signal), [], 'all');
end
