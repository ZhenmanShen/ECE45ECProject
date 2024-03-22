function output = audio_fade_in(input, freq, fadeDuration)
    %Check User Input
    if fadeDuration > (length(input) / freq)
        fadeDuration = (length(input) / freq); 
    end

    % Convert fade duration to samples
    samples = fadeDuration * freq;

    % Create fade-in vector. We fill it with quadratically spaced values from
    % 0 to 1 to emphasize the fade-in effect. 
    fade_in = linspace(0, 1, samples)'.^2;

    % Apply fade-in effect
    for i=1:samples
        if i < samples && i < length(input)
            input(i) = input(i) * fade_in(i); 
        end 
    end 

    %Copy the audio data to an output audio wave. 
    output = zeros(length(input), 1); 
    
    for i=1:length(input)
        output(i) = input(i); 
    end 

    % Write audio with fade-in to a new file
    sound(output, freq); 
end
