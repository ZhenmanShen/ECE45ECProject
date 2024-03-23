  % Contributors: 
  % Eric Palafox
  % input_signal: input sound signal, 1-dimensional 
  % fs: sampling frequency

function output_signal = dist_filt(input_signal, fs, LOW_FREQ, HIGH_FREQ)
    % Compute the FFT of the input signal
    input_size = length(input_signal);
    x = fs * (-input_size/2:input_size/2-1)/input_size;
    output = fftshift(fft(input_signal)); % Shift zero-frequency component to center of spectrum
    
    % Apply distortion by attenuating frequencies within the specified range
    for i = 1:length(output)
        if (LOW_FREQ < abs(x(i)) && abs(x(i)) < HIGH_FREQ)
            output(i) = output(i) / LOW_FREQ; % Divide by LOW_FREQ to attenuate
        end
    end
    
    % Compute the inverse FFT to obtain the distorted signal
    output_signal = ifft(ifftshift(output));
end
