function plot_freqResSin(samplingRate, frequency, filteredSignal, graphMag, graphPhase)
    %Time length set to 1
    T = 1;
    t = linspace(0, T, T*samplingRate);
    origSignal = sin(2 * pi * frequency * t);

    plot_freqRes(origSignal, filteredSignal, samplingRate, graphMag, graphPhase);
end