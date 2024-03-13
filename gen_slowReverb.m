% Function for slow and reverb filter
function filteredSignal = gen_slowReverb(signal, factor, reverberationTime)
    % Perform time stretching
    slowedSignal = resample(signal, round(length(signal) / factor), length(signal));
        
    % Apply reverberation effect
    filteredSignal = gen_reverbforSlow(slowedSignal, reverberationTime);
end