function chorusSignal = chorus(signal, numVoices, maxDelay, modDepth, modFreq, Fs)
    % Apply chorus effect to the input signal
    
    % Create delay times for each voice
    delayTimes = linspace(0, maxDelay, numVoices);
    
    % Generate modulation signal
    t = (0:length(signal)-1) / Fs;
    modSignal = modDepth * sin(2*pi*modFreq*t);
    
    % Initialize delayed signals
    delayedSignals = zeros(length(signal), numVoices);
    
    % Apply delay and modulation to each voice
    for i = 1:numVoices
        % Calculate delay in samples
        delaySamples = round(delayTimes(i) * Fs);
        %isp(['Voice ', num2str(i), ': Delay samples = ', num2str(delaySamples)]);
        
        % Apply modulation to delay time
        modulatedDelay = delaySamples + round(modDepth * modSignal);
        %disp(['Voice ', num2str(i), ': Modulated delay = ', num2str(modulatedDelay)]);
        
        % Ensure that the delay stays within the bounds of the signal
        modulatedDelay(modulatedDelay < 1) = 1;
        modulatedDelay(modulatedDelay > length(signal)) = length(signal);
        
        % Convert modulatedDelay to integers to ensure it's a valid index
        modulatedDelay = round(modulatedDelay);
        
        % Create delayed signal
        delayedSignal = circshift(signal, modulatedDelay);
        
        % Ensure delayedSignal is a column vector
         delayedSignal = delayedSignal(1:length(signal));
        
        % Store delayed signal in delayedSignals matrix
        delayedSignals(:, i) = delayedSignal;
    end
    
    % Mix delayed signals with original signal
    chorusSignal = mean([signal, delayedSignals], 2);
end
