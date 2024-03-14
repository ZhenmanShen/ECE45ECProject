% Function for high pitch and fast filter
% gen_highPitch: Generates a high-pitched version of the input signal by performing time stretching

% Contributors:
% Kenneth Casimiro

% Documentation:
% This function generates a high-pitched version of the input signal by performing time stretching.
% Time stretching alters the playback speed of the signal without changing its pitch, 
% effectively compressing or expanding the time axis of the waveform.

% Function Input:
% signal: Input signal to be processed
% factor: Stretching factor, a value greater than 1 increases the pitch, and less than 1 decreases the pitch.

% Returned Output:
% filteredSignal: High-pitched version of the input signal

% Example usage:
% filteredSignal = gen_highPitch(signal, factor);
function filteredSignal = gen_highPitch(signal, factor)
     % Perform time stretching
     filteredSignal = resample(signal, round(length(signal) / factor), length(signal));
end