% Generates an ECG waveform and accompanying heartbeat sound
%
% Contributors:
% Jasmine Le
%
% Documentation:
%   fs: Sampling frequency for the audio
%   dur: Duration of the audio (in seconds)
%   t: Time vector (in seconds)
%   ecg_waveform: Simulated ECG-like waveform
%   heartbeat_sound: Simulated heartbeat sound
%   combined_signal: Combined ECG waveform and heartbeat sound
%
% Description:
%   This function generates an ECG waveform and accompanying heartbeat
%   sound using sinusoidal components. It synthesizes the ECG waveform by
%   combining P wave, QRS complex, and T wave components generated by
%   'gen_ecg_waveform' function. The heartbeat sound is generated using a
%   simple sine wave with a decaying envelope to mimic the fading of the
%   heartbeat sound over time, created by the 'gen_heartbeat_sound'
%   function. The ECG waveform and heartbeat sound are then combined to
%   create a single signal. The combined signal is plotted, written to an
%   audio file, and played.
%
% Functions:
%   gen_ecg_waveform: Generates a simulated ECG-like waveform
%   gen_heartbeat_sound: Generates a simulated heartbeat sound
function ecg_waveform = gen_ecg_waveform(t)
    % Generate ECG-like waveform
    p_wave = 0.1 * sin(2*pi*0.8*t); % P wave
    qrs_complex = 0.3 * sin(2*pi*1.2*t) + 0.6 * sin(2*pi*2*t) + 0.4 * sin(2*pi*3.5*t); % QRS complex
    t_wave = 0.2 * sin(2*pi*0.6*t); % T wave
            
    % Combine components to form ECG-like waveform
    ecg_waveform = p_wave + qrs_complex + t_wave;
end