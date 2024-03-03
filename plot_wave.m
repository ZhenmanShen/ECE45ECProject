function plot_wave(wave, fs, duration)
        %PLOT_WAVE: plot waveform amplitude versus time (normalized)

        % Contributors:
        % Collin Walmsley
        % 

    x = linspace(0, duration, fs * duration);
    plot(x, wave);
    xlabel("Time (seconds)");
    ylabel("Amplitude (unitless)");
    ylim([-1.1 1.1]);
end