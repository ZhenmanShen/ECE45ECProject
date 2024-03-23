function output = audio_fade_out(input, freq, fadeDuration)
    %Check User Input. If it is greater than the length of the audio, 
    % we set the fade duration to the length of the audio 
    if fadeDuration > (length(input) / freq)
        fadeDuration = (length(input) / freq); 
    end

    % Convert fade duration to samples
    samples = fadeDuration * freq;

    % Create fade-out vector. We fill it with quadratically spaced values from
    % 0 to 1 to emphasize the fade-in effect. We then flip it for the fade
    % out effect. 
    fade_out = flip(linspace(0, 1, samples)'.^2);
    
    % Apply fade-out effect. The k variable indexes the fade_out vector. 
    k = 1;
    for i = length(input)-samples+1:length(input)
        input(i) = input(i)*fade_out(k); 
        k=k+1; 
    end 
  
    % Write audio with fade-out to a new file. 
    output = zeros(length(input), 0); 
    for i = 1:length(input)
        output(i) = input(i);
    end 
end
