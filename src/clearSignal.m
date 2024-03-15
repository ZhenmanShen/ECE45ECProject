% function to reset the signal to nothing
function emptySignal = clearSignal(signal)

% Contributors:
% Max Shen

% Documentation:
% This is ONE OF THE FUNCTIONS I did. It is a foundational function.
% This is a basic function which to reset the signal to nothing.
% It essentailly replace the signal with bunch of zeroes.


% Function Input:
% signal: the input is a signal to be processed

% Return Output:
% emptySignal: An signal that is just full of zeroes.

    emptySignal = zeros(size(signal));

end