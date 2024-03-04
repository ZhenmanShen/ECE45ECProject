function bandpass1(a,b,filename)
[x, fs]=audioread(filename);
n = length(x);
xf=bandpass(x,[a b],fs);
plot(x); hold on;
plot(xf);
sound(xf,fs)