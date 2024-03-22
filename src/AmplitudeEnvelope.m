function output_signal = AmplitudeEnvelope(input_signal, Fs, attack, decay, sustain, release)
    % Calculate sample count
    num_samples = length(input_signal);

    % Create amplitude envelope
    envelope = zeros(1, num_samples); % Initialize with zeros

    % Attack phase
    attack_samples = round(attack * num_samples);
    envelope(1:attack_samples) = linspace(0, 1, attack_samples);

    % Decay phase
    decay_samples = round(decay * num_samples);
    decay_start = attack_samples + 1;
    envelope(decay_start:decay_start+decay_samples-1) = linspace(1, sustain, decay_samples);

    % Sustain phase
    sustain_samples = round((1 - attack - decay - release) * num_samples);
    sustain_start = decay_start + decay_samples;
    envelope(sustain_start:sustain_start+sustain_samples-1) = sustain;

    % Release phase
    release_samples = num_samples - sustain_start - sustain_samples + 1;
    release_start = sustain_start + sustain_samples;
    envelope(release_start:end) = linspace(sustain, 0, release_samples);

    % Apply the envelope to the input signal
    output_signal = envelope .* input_signal;
end
