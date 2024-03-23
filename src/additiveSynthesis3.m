% additiveSynthesis3: Adds the input sine waves,and generates the sound
% (as well as plotting the output signal). Also allows you to makes phase
% shifts and amplitude changes in the code itself. Allows you to introduce
% a level of randomness to create unexpected (and hopefully better) sounds.
% Allows you to vary certain characteristics, such as cutoff frequency,
% resonace, duration, playback direction (play sound backward or forward).
% Contributors: Hamza Ahmed
% Documentation:
   % frequencies: array of frequencies of sine waves (This array size must be
   % same as other array sizes)
   %
   % amplitudes: array of amplitudes corresponding to frequencies (This
   % array size must be same as other array sizes)
   %
   % phases: array of phase shifts corresponding to frequencies (This
   % array size must be same as other array sizes)
   %
   % duration: duration of the combined sound waves or output signal (seconds)
   % samplingRate: sampling rate (Hz)
   % playbackDirection: Plays audio forward or backward, must enter only 'forward' or 'backward'
   % randomnessLevel: intensity of randomness, can be decimal value (0 to 1)
   % filterCutoffFrequency: cutoff frequency of filter (positive value or -1 for no filter)
   % filterResonance: resonance of filter (positive value or -1 for no filter)
function outputSignal = additiveSynthesis3(frequencies, amplitudes, phases, duration, samplingRate, playbackDirection, randomnessLevel, filterCutoffFrequency, filterResonance)
   t = 0:1/samplingRate:duration;
   outputSignal = zeros(size(t));
   % Generate each sine wave and sum them up
   for i = 1:length(frequencies)
       phase = phases(i);
       amplitude = amplitudes(i);
       frequency = frequencies(i);
       % Apply controlled randomness to filter parameters if specified
       if randomnessLevel > 0
           cutoffFrequency = 1000 + 4000 * randomnessLevel * rand(); % Randomized cutoff frequency
           resonanceNoise = randn(size(t)) * 0.1 * randomnessLevel;
           resonance = 0.5 + resonanceNoise; % Randomized resonance
       else
           cutoffFrequency = filterCutoffFrequency;
           resonance = filterResonance;
       end
       % if cutoff frequency is positive
       if cutoffFrequency > 0
           % Generate filter coefficients
           [b, a] = butter(2, cutoffFrequency/(samplingRate/2), 'low'); % Low-pass filter coefficients
           % Apply filter to the sine wave
           sineWave = amplitude * sin(2 * pi * frequency * t + phase);
           filteredSignal = filter(b, a, sineWave);
           % Add filtered signal to output
           outputSignal = outputSignal + filteredSignal;
       
       else
       % If no filter applied, directly add sine wave to output signal
       outputSignal = outputSignal + amplitude * sin(2 * pi * frequency * t + phase);
       end
   end
   % If playback direction is 'backward', reverse the waveform
   if strcmp(playbackDirection, 'backward')
       outputSignal = fliplr(outputSignal);
   end
end