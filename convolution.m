function output_signal = convolution(input_signal_1, input_signal_2)
% output_signal = do the convolution of two input signals

% Contributors:
% Max Shen

% Documentation:
% This function do the convolution of two signals. In the middle of
% researching on how to do this function, I found out that convolution
% is a built-in function in MATLAB.

% Function Input:
% intput_signal_1: the first input signal 
% intput_signal_2: the second input signal 

% Function Output:
% output_signal: the resulting signal after convolution

    % Use the MATLAB Built-In convolution function to convolute the 
    % the two input signals and result in the ouput_signal. 
    output_signal = conv(input_signal_1, input_signal_2);


end

    

    