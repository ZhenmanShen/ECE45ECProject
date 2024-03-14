function speed_changed_signal = speedChange(signal, speedScale, fs)
% speed_changed_signal: change the speed depending on the speedScale

% Contributors:
% Max Shen 

% Documentation:
% This function changes the speed of the input signal by alternating
% the sampling frequency. It should be noted that it is best that
% the speedScale does not exceed 2. There will be distortation.

% Function Input: 
% signal: the input signal
% speedScale: If the scale is an positive integer, it will speed up 
% the signal. However, if the speedScale is a decimal, then it will
% slow down the signal by that factor.

% Function Input:
% signal: the input signal
% speedScale: the factor of speeding up or slowing down
% fs: the sampling frequency

% Function Output:
% speed_changed_signal: the resulting signal after speedChange
    
    if speedScale <= 0
        error('Invalid input: speedScale must be greater than 0')
    end
    
    % Calculate the new sampling rate
    newFs = fs / speedScale;

    % Resample the signal to the new sampling rate
    speed_changed_signal = resample(signal, newFs, fs);
    
  

end