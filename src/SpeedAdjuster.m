
% plays speed-shifted audio when button is clicked
function SpeedAdjuster(input_wave,shift_slider)
    [audio, Fs] = audioread(input_wave);


    freqChange = 2^(shift_slider.Value/12);
% calculates percent change in frequency. 12 semitones. So if shift=2
% , freqChange = 2^(2/12) = 1.1225, which is a
% 11.25% increase in frequency

    output_wave = resample(audio, Fs, round(Fs * freqChange));

end

