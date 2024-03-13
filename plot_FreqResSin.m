function plotFreqResSin = plot_freqResSin(samplingRate, frequency, filteredSignal)
    T = 1;
    t = linspace(0, T, T*samplingRate);
    origSignal = sin(2 * pi * frequency * t);
    plot_freqRes(origSignal, filteredSignal, samplingRate);
end