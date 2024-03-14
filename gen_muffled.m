% gen_muffled: Output a muffled signal compared to original input signal
% sound is in time domain, appears as if the signal is distant for listener
% Contributors:
% Eric Palafox
% DOCUMENTATION
% input_signal: input sound signal
% fs: sampling frequency
% LOW_FREQ: low frequencies
% MID_FREQ: mid frequencies
% HIGH_FREQ: high frequencies

function output_signal = gen_muffled(input_signal, fs, LOW_FREQ, MID_FREQ, HIGH_FREQ)

input_size = size(input_signal, 2);

non_stereo = input_signal;

if (input_size == 1) || (input_size == 2)
    non_stereo = input_size (:, 1);        % only take 1st column of data, remove stereophonic property
    non_stereo = transpose(non_stereo);
end

mod_input = non_stereo(1, :);

size = length(mod_input);
FREQ = fs * ((-size/2): (size(2) - 1) / size); % new array of frequencies, FFT shifted signal
input_freq = fftshift(fft(mod_input)); % Fourier Transform of input, fftshift() will ensure zero frequency is at the middle of the array
low_pass = zeros(1, length(input_freq));

% Implement Low Pass filter
for i = 1:length(low_pass)
        if abs(FREQ(i)) < i
            low_pass(i) = 1;
        else
            low_pass(i) = 0;
        end
end

lowpass_input = input_freq .* low_pass; % apply low pass
lowpass_input = transpose(lowpass_input);

real_output = real(ifft(fftshift(lowpass_input)));

delay = 0.001;                  % apply delay of sound using seconds
first_index = round(delay*fs);  % first index where sound begins, delay multiplied by sampling frequency
delay_output = [zeros(first_index, 1); real_output];      % create minimal delay on signal, adds first_index zeros to beginning of real_output
delay_output = delay_output(1:length(real_output));         % remove delay_output vector, add to "real_output" vector

output_signal = (real_output + delay_output) ./ 2.0;        % add real_output" and "delay_output" vectors, reverb effect, the division by 2 will prevent clipping

output_signal = transpose(output_signal);

end
