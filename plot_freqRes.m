function plot_freqRes(origSignal, filteredSignal, fs, graphMag, graphPhase)
    % X is the input signal, Y is the output signal
    % H is the frequency response
    X = fft(origSignal);
    Y = fft(filteredSignal);

    dimensions = size(Y);
    X = resize(X, dimensions);

    H = Y ./ X;

    % Plot the magnitude and phase of the frequency response
    frequencies = linspace(0, fs/2, length(H));
    
    plot(graphMag, frequencies, abs(H));
    plot(graphPhase, frequencies, angle(H));
end
