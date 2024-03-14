function filtered_signal = enhance1(a,b,z,filename)
[y,fs] = audioread(filename);
N = length(filename);
audio_fft = fft(y);
krs = fft(y);
F = (0:N-1)*(fs/N);
dt = 1/fs;
t = 0:dt:(length(y)*dt)-dt;
figure;
subplot(2,1,1);
plot(t, y);
title('Original Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');
indices = find(F >= a & F <= b);

audio_fft(indices) = audio_fft(indices) * z;
FR = ifft(audio_fft);
filtered_signal = abs(FR);

new_audio_file = 'filtered_signal.wav'; % Specify the filename for the new WAV file
audiowrite(new_audio_file, real(filtered_signal), fs)
[r,fs] = audioread('filtered_signal.wav');
% Plot the original and modified audio signals

plot(r); hold on;
plot(abs(audio_fft));