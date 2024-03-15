function filtered_signal=bandpass1(a,b,filename)
    %takes the range of frequencies a and b as well as the name of the wave
    %file
    [x, fs]=audioread(filename);
    %gets fs from the file as well as x, which is the column vector with the
    %audiodaata
    N = length(x);
    %gets the length which might be useful
    filtered_signal=bandpass(x,[a b],fs);
    %applies the bandpass filter
end