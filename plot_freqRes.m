function plotFreqRes = plot_freqRes(origSignal, filteredSignal, fs)
    % X is the input signal, Y is the output signal
    % H is the frequency response
    % Sampling Frequency set at 44100
    X = fft(origSignal);
    Y = fft(filteredSignal);
    H = Y ./ X;

    % Plot the magnitude and phase of the frequency response
    frequencies = linspace(0, fs/2, length(H));
    
    plot(app.graph_FR_M, frequencies, abs(H));
    plot(app.graph_FR_P, frequencies, angle(H));
end
