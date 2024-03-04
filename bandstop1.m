function bandstop1(a,b,filename)
[x, fs]=audioread(filename);
N = length(x);
xf=bandstop(x,[a b],fs);
plot(x); hold on;
plot(xf);
sound(xf,fs)