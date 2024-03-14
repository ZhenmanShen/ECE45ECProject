function output_wave = change_pitch(input_wave, factor)
    % input_wave: input sound wave
    % factor: pitch change factor (1 for no change)
    
    % Read the input sound wave file
    [input_wave, Fs] = audioread(input_wave);
    
    output_wave = shiftPitch(input_wave, factor);
end
