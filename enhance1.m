function filtered_signal = enhance1(a,b,z,filename)
[y,fs] = audioread(filename);
N = length(filename);
audio_fft = fft(y);
krs = fft(y);
F = (0:N-1)*(fs/N);
dt = 1/fs;
t = 0:dt:(length(y)*dt)-dt;

indices = find(F >= a & F <= b);

audio_fft(indices) = audio_fft(indices) * z;
FR = ifft(audio_fft);
filtered_signal = abs(FR);

