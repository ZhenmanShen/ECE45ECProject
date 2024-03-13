function plot_freqResSin(samplingRate, frequency, filteredSignal, graphMag, graphPhase)
    %Time length set to 1
    T = 1;
    t = linspace(0, T, T*samplingRate);
    origSignal = sin(2 * pi * frequency * t);
<<<<<<< HEAD:plot_FreqResSin.m
    plot_freqRes(origSignal, filteredSignal, samplingRate, graphMag, graphPhase);
end
=======
    plot_freqRes(origSignal, filteredSignal, samplingRate);
end
>>>>>>> 18ed8f0e7c4d2c6e20afbcf4ef71d205da981895:plot_freqResSin.m
