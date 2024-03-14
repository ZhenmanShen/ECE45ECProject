function s = gen_sawtooth(amp, freq, phase, fs, dur, duty)
        % gen_sawtooth: Returns a matrix of sampled (fs) sawtooth wave

        % Contributors:
        % Collin Walmsley
        % 
        
        % Documentation:
        % amp: Do not go over 1, as it distorts
        % freq: frequency desired for wave
        % phase: number of periods (phase * 2*pi)), where (0.0 <= phase < 1.0)
        % fs: sampling frequency, digitizes wave
        % dur: time in seconds
        % duty: N/A for sawtooth

    pShift = phase * 2*pi;
    t = 0: 1/fs: dur - 1/fs;
    
    s = amp * sawtooth(2*pi*freq*t - pShift);

end