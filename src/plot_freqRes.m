% plot_freqRes: plots the frequency response graphs for the applied filter

% Contributor:
% Jacob Zhang

% Documentation:
% origSignal - the original signal with no filter applied
% filteredSignal - the filtered signal
% fs - the frequency sampling rate
% graphMag - the graph where the magnitude of the frequency response should
% be applied
% graphPhase - the graph where the phase of the frequency response should 
% be applied

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
