function audioFilterGUI()
    % Create figure
    fig = figure('Name', 'Audio Filter GUI', 'Position', [200, 200, 600, 400]);
    
    % Original audio signal
    originalSignal = audioread('sadvalentine.wav'); % Provide your audio file
    
    % Dropdown menu for selecting filter
    filterDropdown = uicontrol('Style', 'popupmenu', 'String', {'High Pitch & Fast', 'Slow & Reverb'}, ...
        'Position', [50, 350, 200, 30], 'Callback', @applyFilter);
    
    % Axes for displaying signals
    axOriginal = axes('Units', 'pixels', 'Position', [50, 100, 500, 200]);
    xlabel('Time');
    ylabel('Amplitude');
    title('Original Signal');
    
    axFiltered = axes('Units', 'pixels', 'Position', [50, 100, 500, 200]);
    xlabel('Time');
    ylabel('Amplitude');
    title('Filtered Signal');
    set(axFiltered, 'Visible', 'off'); % Initially hide filtered signal
    
    % Play button
    playButton = uicontrol('Style', 'pushbutton', 'String', 'Play Filtered Sound', ...
        'Position', [50, 50, 200, 30], 'Callback', @playFilteredSound);
    
    % Create audioplayer object
    player = [];
    
    % Function to apply selected filter
    function applyFilter(source, ~)
        % Stop playback if player is active
        stopPlayback();
        
        selectedFilter = source.Value;
        
        switch selectedFilter
            case 1 % High Pitch & Fast
                factor = 2.0;
                filteredSignal = highPitchFast(originalSignal, factor);
            case 2 % Slow & Reverb
                factor = 0.25; % Slow down by 75%
                reverberationTime = 1; % One second reverberation time
                filteredSignal = slowReverb(originalSignal, factor, reverberationTime);
        end
        
        % Plot original and filtered signals
        plot(axOriginal, originalSignal, 'b');
        title(axOriginal, 'Original Signal');
        
        plot(axFiltered, filteredSignal, 'r');
        title(axFiltered, 'Filtered Signal');
        set(axFiltered, 'Visible', 'on'); % Show filtered signal
    end

    % Function for high pitch and fast filter
    function filteredSignal = highPitchFast(signal, factor)
        % Perform time stretching
        filteredSignal = resample(signal, round(length(signal) / factor), length(signal));
    end

    % Function for slow and reverb filter
    function filteredSignal = slowReverb(signal, factor, reverberationTime)
        % Perform time stretching
        slowedSignal = resample(signal, round(length(signal) / factor), length(signal));
        
        % Apply reverberation effect
        filteredSignal = reverberate(slowedSignal, reverberationTime);
    end

    % Function to add reverberation effect
    function reverberatedSignal = reverberate(signal, reverberationTime)
        % Apply reverberation effect using a simple delay line
        delay = round(0.05 * length(signal)); % Delay length (adjust as needed)
        decay = 0.5; % Decay factor (adjust as needed)
        
        % Create empty signal for reverberation
        reverberatedSignal = zeros(size(signal));
        
        % Apply delay and decay
        for i = 1:length(signal)
            if i - delay > 0
                reverberatedSignal(i) = signal(i) + decay * signal(i - delay);
            else
                reverberatedSignal(i) = signal(i);
            end
        end
    end

    % Function to play filtered sound
    function playFilteredSound(~, ~)
        selectedFilter = filterDropdown.Value;
        
        switch selectedFilter
            case 1 % High Pitch & Fast
                factor = 2.0;
                filteredSignal = highPitchFast(originalSignal, factor);
            case 2 % Slow & Reverb
                factor = 0.25; % Slow down by 50%
                reverberationTime = 1; % One second reverberation time
                filteredSignal = slowReverb(originalSignal, factor, reverberationTime);
        end
        
        % Stop playback if player is active
        stopPlayback();
        
        % Play the filtered sound
        player = audioplayer(filteredSignal, 44100);
        play(player);
    end

    % Function to stop playback
    function stopPlayback()
        if ~isempty(player) && isplaying(player)
            stop(player);
        end
    end
end
