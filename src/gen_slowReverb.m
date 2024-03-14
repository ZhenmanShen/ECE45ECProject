% Function for slow and reverb filter
function filteredSignal = gen_slowReverb(signal, factor, reverberationTime)
% gen_slowReverb: Generates a slow version of the input signal with added reverberation effect

% Contributors:
% Kenneth Casimiro

% Documentation:
% This function generates a slow version of the input signal by performing time stretching and
% adds a reverberation effect using a simple delay line.
% The time stretching alters the playback speed of the signal without changing its pitch,
% effectively compressing or expanding the time axis of the waveform.
% Reverberation simulates the persistence of sound in an enclosed space, creating a sense of
% spaciousness and depth in audio recordings.

% Function Input:
% signal: Input signal to be processed
% factor: Stretching factor, a value greater than 1 slows down the signal
% reverberationTime: Time it takes for the reverberation to decay to a level 60dB below the original signal (in seconds)

% Returned Output:
% filteredSignal: Slow version of the input signal with added reverberation effect

% Example usage:
% filteredSignal = gen_slowReverb(signal, factor, reverberationTime);
    % Perform time stretching
    slowedSignal = resample(signal, round(length(signal) / factor), length(signal));
        
    % Apply reverberation effect
    filteredSignal = gen_reverbforSlow(slowedSignal, reverberationTime);
end