%AmplitudeEnvelope: Generate an amplitude envelope and apply it to the input signal
%Contributors:
% Madhav Baghla
%
%Documentation:
%   - input_signal: Input signal
%   - Fs: Sampling frequency in Hz
%   - attack: Attack time (percentage of total duration)
%   - decay: Decay time (percentage of total duration)
%   - sustain: Sustain level (0 to 1)
%   - release: Release time (percentage of total duration)
% Output:
%   - output_signal: Output signal with amplitude envelope applied

        
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
  release_samples = round(release * num_samples);
  release_start = sustain_start + sustain_samples;
  envelope(release_start:end) = linspace(sustain, 0, release_samples);

  % Apply the envelope to the input signal
  output_signal = envelope .* input_signal;

  % Plot the output signal
  t_output = (0:length(output_signal)-1) / Fs;
  plot(t_output, output_signal);
  xlabel('Time (s)');
  ylabel('Amplitude');
  title('Output Signal with Amplitude Envelope');
  grid on;

  % Set the y-axis limits based on the signal amplitude
  ylim([-1.2*max(abs(output_signal)), 1.2*max(abs(output_signal))]);

  % Play the sound
  sound(output_signal, Fs);

  end
