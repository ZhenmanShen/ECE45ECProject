% Function for high pitch and fast filter
function filteredSignal = gen_highPitch(signal, factor)
     % Perform time stretching
     filteredSignal = resample(signal, round(length(signal) / factor), length(signal));
end