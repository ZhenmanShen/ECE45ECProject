function s = gen_square(amp, freq, phase, fs, dur, duty)
        % gen_square: Returns a matrix of sampled (fs) square wave

        % Contributors:
        % Collin Walmsley
        % 
        
        % Documentation:
        % amp: Do not go over 1, as it distorts
        % freq: frequency desired for wave
        % phase: number of periods (phase * 2*pi)), where (0.0 <= phase < 1.0)
        % fs: sampling frequency, digitizes wave
        % dur: time in seconds
        % duty: percentage of time on HIGH (70 means HIGH amp for 70% of
        %   period (0 < duty < 100)

    pShift = phase * 2*pi;
    t = 0: 1/fs: dur - 1/fs;
    
    s = amp * square(2*pi*freq*t - pShift, duty);

end