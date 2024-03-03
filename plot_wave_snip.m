function plot_wave_snip(wave, fs, duration)
        %PLOT_WAVE_SNIP: plot a couple cycles of waveform to better
        %visualize the wave

        % Contributors:
        % Collin Walmsley
        % 
    
    

    x = linspace(0, duration, fs * duration);
    xt = x;
    [peak, locs] = findpeaks(wave, xt);

    plot(x, wave);
    xlabel("Time (seconds)");
    ylabel("Amplitude (unitless)");
    xlim([0 locs(4)])
    ylim([-1.1 1.1]);
end