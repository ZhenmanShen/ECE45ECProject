% gen_white_noise: Generates a white noise signal.

% Contributors:
% May Zhang

% Documentation:
% frequency: The desired frequency of the white noise. 
% duration: The length of time the white noise signal lasts for.

function noise = gen_white_noise(frequency, duration)
    % Compute time vector
    dt = 1/frequency;
    t = 0:dt:duration-dt;

    % Number of samples
    N = length(t);

    % Generate white noise
    noise = 0.5 * randn(1, N);
end
