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
    output = input;   
    for i=1:samples
        output(i) = output(i) * fade_in(i); 
    end 

    % Write audio with fade-in to a new file
    sound(output, freq); 
    %audiowrite(outputFilePath, yFadeIn, Fs);
end
