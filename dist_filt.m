  % Contributors: 
  % Eric Palafox
  % input_signal: input sound signal, 1-dimensional 
  % fs: sampling frequency
  % LOW_FREQ: low frequencies
  % MID_FREQ: mid frequencies
  % HIGH_FREQ: high frequencies
  % output_signal: final distorted output signal
  
  
function output_signal = dist_filt(input_signal, fs, LOW_FREQ, MID_FREQ, HIGH_FREQ)

  input_size = length(input_signal);
  x = fs * (-input_size/2:input_size/2-1)/input_size;

  output = fftshift(fft(input_signal)); % shift zero-frequency component to center of spectrum
  
  % distort signal via constant LOW_FREQ, frequencies within the range are cut by constant amount of LOW_FREQ
  for i = 1:length(output)
    if ((LOW_FREQ < abs(x(i))) && HIGH_FREQ > abs(x(i)))
      output(i) = output(i) / LOW_FREQ;
    end
  end
  output_signal = real(ifft(fftshift(output_signal)));
end
