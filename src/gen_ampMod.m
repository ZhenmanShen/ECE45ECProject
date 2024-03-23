function a = gen_ampMod(carrier_f, mod_f, mod_index, fs, dur)
        % gen_amp: Generates a amplitude-modulated version of the input signal
        % 
        % Contributors:
        % Ashley Thai
        % 

        % Documentation:
        % carrier_f: carrier frequency (Hz)
        % mod_f: modulating frequency (Hz)
        % mod_index: modulation index
        % fs: sampling frequency (Hz)
        % dur: duration (s)

t = 0: 1/fs: dur-1/fs;

carrier_signal = sin(2*pi*carrier_f*t);

mod_signal = sin(2*pi*mod_f*t);

a = (1 + mod_index*mod_signal).*carrier_signal;

% normalizes the signal
a = a/max(abs(a));

end

