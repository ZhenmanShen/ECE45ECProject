% Function to add reverberation effect
function reverberatedSignal = gen_reverbforSlow(signal, reverberationTime)
% gen_reverbforSlow: Adds reverberation effect to the input signal using a simple delay line

% Contributors:
% Kenneth Casimiro

% Documentation:
% This function adds a reverberation effect to the input signal using a simple delay line.
% Reverberation simulates the persistence of sound in an enclosed space, creating a sense of
% spaciousness and depth in audio recordings.

% Function Input:
% signal: Input signal to be processed
% reverberationTime: Time it takes for the reverberation to decay to a level 60dB below the original signal (in seconds)

% Returned Output:
% reverberatedSignal: Input signal with added reverberation effect

% Example usage:
% reverberatedSignal = gen_reverbforSlow(signal, reverberationTime);
    % Apply reverberation effect using a simple delay line
    delay = round(0.05 * length(signal)); % Delay length (adjust as needed)
    decay = 0.5; % Decay factor (adjust as needed)
        
    % Create empty signal for reverberation
    reverberatedSignal = zeros(size(signal));
        
        % Apply delay and decay
   for i = 1:length(signal)
       if i - delay > 0
           reverberatedSignal(i) = signal(i) + decay * signal(i - delay);
       else
       reverberatedSignal(i) = signal(i);
       end
   end
end