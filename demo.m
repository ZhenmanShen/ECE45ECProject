function delay_demo()
    % Load your own sound file
    [your_sound, Fs_sound] = audioread('test.wav'); % Update the file name as needed

    % Initial delay parameters
    initial_delay_time = 0.5; % in seconds
    initial_feedback_gain = 0.5;

    % Generate delayed signal with initial parameters
    delayed_signal = gen_delay(your_sound, Fs_sound, initial_delay_time, initial_feedback_gain);

    % Create figure window
    fig = figure('Position', [200, 200, 800, 600], 'Name', 'Delay Demo');
    
    % Create delay time slider
    delay_slider = uicontrol('Style', 'slider', 'Min', 0, 'Max', 2, ...
        'Value', initial_delay_time, 'Position', [100, 500, 400, 20], ...
        'Callback', @update_delay);

    delay_text = uicontrol('Style', 'text', 'Position', [50, 500, 40, 20], ...
        'String', 'Delay');

    % Play buttons
    play_original_button = uicontrol('Style', 'pushbutton', 'String', 'Play Original', ...
        'Position', [100, 450, 150, 30], 'Callback', @play_original);
    
    play_delayed_button = uicontrol('Style', 'pushbutton', 'String', 'Play Delayed', ...
        'Position', [350, 450, 150, 30], 'Callback', @play_delayed);

    % Create subplots for original and delayed signals
    subplot(2, 1, 1);
    plot(linspace(0, length(your_sound) / Fs_sound, length(your_sound)), your_sound);
    title('Original Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

    subplot(2, 1, 2);
    plot(linspace(0, length(delayed_signal) / Fs_sound, length(delayed_signal)), delayed_signal);
    title('Delayed Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

    % Callback function to update delay
    function update_delay(~, ~)
        % Get delay time from slider
        delay_time = delay_slider.Value;
        
        % Generate delayed signal with updated delay time
        delayed_signal = gen_delay(your_sound, Fs_sound, delay_time, initial_feedback_gain);
        
        % Update delayed signal plot
        subplot(2, 1, 2);
        plot(linspace(0, length(delayed_signal) / Fs_sound, length(delayed_signal)), delayed_signal);
        title('Delayed Signal');
        xlabel('Time (s)');
        ylabel('Amplitude');
    end

    % Callback functions for play buttons
    function play_original(~, ~)
        sound(your_sound, Fs_sound);
    end

    function play_delayed(~, ~)
        % Mix original and delayed signals to create echo effect
        mixed_signal = your_sound + initial_feedback_gain * delayed_signal;
        sound(mixed_signal, Fs_sound);
    end
end
