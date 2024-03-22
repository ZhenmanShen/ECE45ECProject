function output = audio_fade_out(input, freq, fadeDuration)
    %Check User Input. If it is greater than the length of the audio, we set the fade duration to the length of the audio 
    if fadeDuration > (length(input) / freq)
        fadeDuration = (length(input) / freq); 
    end

    % Convert fade duration to samples
    samples = fadeDuration * freq;

    % Create fade-in vector. We fill it with quadratically spaced values from
    % 0 to 1 to emphasize the fade-in effect. We then flip it for the fade
    % out effect. 
    fade_out = flip(linspace(0, 1, samples)'.^2);
    

    % Apply fade-in effect
    output = input;
    output(end-samples+1:end) = input(end-samples+1:end) .* fade_out;

    % Write audio with fade-in to a new file
    sound(output, freq); 
end
