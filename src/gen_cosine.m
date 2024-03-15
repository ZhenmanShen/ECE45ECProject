function c = gen_cosine(amp, freq, phase, fs, dur, duty)
        % gen_cosine: Returns a matrix of sampled (fs) cosine wave

        % Contributors:
        % Collin Walmsley
        % 
        
        % Documentation:
        % amp: Do not go over 1, as it distorts
        % freq: frequency desired for wave
        % phase: number of periods (phase * 2*pi)), where (0.0 <= phase < 1.0)
        % fs: sampling frequency, digitizes wave
        % dur: time in seconds
        % duty: N/A for Cosine

    pShift = phase * 2 * pi;
    n = fs * dur; % sampling freq * dur gives n samples
    tn = 1 / fs;
    
    c = zeros(1, n); 
    % s matrix with n samples

    for i = 1:n
        t = i * tn;
        c(i) = amp * cos(2*pi * freq * t - pShift);
        % populates digitized cosine wave of n samples
    end

end