%Collaborators : Ethan Kook

% make figure window
fig = figure;
fig.Position(3:4) = [800 600];

% make shift slider and text box
shift_text = uicontrol('Style', 'text', 'Position', [50 50 40 20], 'String', 'Shift');
shift_value_text = uicontrol('Style', 'text', 'Position', [410 50 50 20], 'String', '0.00');

shift_slider = uicontrol('Style', 'slider', 'Min', -12, 'Max', 12, ...
    'Value', 0, 'Position', [100 50 300 20], 'Callback', {@update_plot, shift_value_text});

% make button to play speed-shifted audio
play_button = uicontrol('Style', 'pushbutton', 'String', 'Play', ...
    'Position', [100 20 100 20], 'Callback', {@play_audio, shift_slider, fig});

% make button to pause audio
pause_button = uicontrol('Style', 'pushbutton', 'String', 'Pause', ...
    'Position', [210 20 100 20], 'Callback', {@pause_audio, fig});

% updates plot when slider value changes
function update_plot(source, event, shift_value_text)
    shift_value_text.String = sprintf('%.2f', source.Value);
end

% plays speed-shifted audio when button is clicked
function play_audio(source, event, shift_slider, fig)
    [audio, Fs] = audioread('audio.wav');


    freqChange = 2^(shift_slider.Value/12);
% calculates percent change in frequency. 12 semitones. So if shift=2
% , freqChange = 2^(2/12) = 1.1225, which is a
% 11.25% increase in frequency

    newAudio = resample(audio, Fs, round(Fs * freqChange));
    player = audioplayer(newAudio, Fs);
    play(player);
    guidata(fig, player); 
end

% pauses audio when button is clicked
function pause_audio(source, event, fig)
    player = guidata(fig);
    if ~isempty(player)
        if isplaying(player)
            pause(player);
        else
            resume(player);
        end
    end
end
