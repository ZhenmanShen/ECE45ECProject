function phase_frequency_offset_demo()
    % Define initial parameter values and generate initial signals
    f = 10;                 % Signal frequency (Hz)
    phase_offset = 0;       % Initial phase offset in radians
    freq_offset = 0;        % Initial frequency offset in Hz
    Fs = 1000;              % Sampling frequency (Hz)

    [t, x, x_phase_offset, x_freq_offset] = gen_offset(f, phase_offset, freq_offset, Fs);

    % Create figure window
    fig = figure;
    fig.Position(3:4) = [800 600];

    % Create phase offset slider and text box
    phase_slider = uicontrol('Style', 'slider', 'Min', -pi, 'Max', pi, ...
        'Value', phase_offset, 'Position', [100 50 300 20], 'Callback', @update_plot);
    phase_text = uicontrol('Style', 'text', 'Position', [50 50 40 20], 'String', 'Phase');

    phase_value_text = uicontrol('Style', 'text', 'Position', [410 50 50 20], 'String', sprintf('%.2f', phase_slider.Value));

    % Create frequency offset slider and text box
    freq_slider = uicontrol('Style', 'slider', 'Min', -10, 'Max', 10, ...
        'Value', freq_offset, 'Position', [100 20 300 20], 'Callback', @update_plot);
    freq_text = uicontrol('Style', 'text', 'Position', [50 20 40 20], 'String', 'Freq');

    freq_value_text = uicontrol('Style', 'text', 'Position', [410 20 50 20], 'String', sprintf('%.2f', freq_slider.Value));

    % Plot original signal
    subplot(3,1,1);
    h1 = plot(t,x);
    title('Original Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

    % Plot for signal with phase offset
    subplot(3,1,2);
    h2 = plot(t,x_phase_offset);
    title('Signal with Phase Offset');
    xlabel('Time (s)');
    ylabel('Amplitude');

    % Plot for signal with frequency offset
    subplot(3,1,3);
    h3 = plot(t,x_freq_offset);
    title('Signal with Frequency Offset');
    xlabel('Time (s)');
    ylabel('Amplitude');

    % Define the update_plot function here to access slider objects
    function update_plot(~, ~)
        % Get slider values
        phase_offset = phase_slider.Value;
        freq_offset = freq_slider.Value;

        % Update text boxes
        set(phase_value_text, 'String', sprintf('%.2f', phase_offset));
        set(freq_value_text, 'String', sprintf('%.2f', freq_offset));

        % Update signals
        [~, ~, x_phase_offset, x_freq_offset] = gen_offset(f, phase_offset, freq_offset, Fs);

        % Update plots
        set(h2, 'YData', x_phase_offset);
        set(h3, 'YData', x_freq_offset);
    end
end