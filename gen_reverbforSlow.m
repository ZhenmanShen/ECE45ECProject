    % Function to add reverberation effect
    function reverberatedSignal = gen_reverbforSlow(signal, reverberationTime)
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