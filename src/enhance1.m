% multiplies the amplitude in a specific set of frequencies.

% Contributors:
% Joel Jijo

% Documentation:
% a min frequency
% b max frequency
% filename name of file
% z multiplier

%JOEL JIJO 
%TAKES A RANGE OF FREQUENCIES A TO B THEN GETS A MULTIPLIER TO THE AMPLITUDE OF THE SIGNAL Z
%IT THEN APPLIES THE MUTLIPLIER TO SAID RANGE OF FREQUENCIES
function filtered_signal = enhance1(a,b,z,filename)
    [y,fs] = audioread(filename);
    %gets the sampling frequency and the column vector y
    N = length(filename);
    %gets the length of the file
    audio_fft = fft(y);
    %takes the fourier transform of the values of y
    krs = fft(y);
    %takes the fourier transform of the values of y for reference
    F = (0:N-1)*(fs/N);
    %this is the frequencies of the file
    dt = 1/fs;
    t = 0:dt:(length(y)*dt)-dt;
    %gets the time of the function
    indices = find(F >= a & F <= b);
    %gets the indices of the frequencies that are higher and lower than the set frequencies
    audio_fft(indices) = audio_fft(indices) * z;
    %modifies the indices by the factor z
    filtered_signal = ifft(audio_fft(indices));
end

