function gen_song_examples(amp, freq, phase, fs, dur, duty)
% Ode to Joy Example, Mary Had a Little Lamb Example
% gen_ode_to_joy: Generates a .wav file of 'Ode to Joy' melody and 'Mary Had a Little Lamb'

% Contributors:
% Kendra Chen

% Documentation:
% amp: Any number allowed, at high amplitudes the sound will be louder
% freq: Not used for this method
% phase: Try shifting introducing a phase shift of pi/4!
% fs: sampling frequency, recommended 44.1k
% dur: duration of a single note, recommended 0.3
% duty: Not used for this method

%Citations:
% Note to Frequency Lookup Table
% https://mixbutton.com/mixing-articles/music-note-to-frequency-chart/
% Ode to Joy Sheet Music
% https://cdn3.virtualsheetmusic.com/images/first_pages/BIG/Beethoven/OdeJoySQuartetFirst_BIG.gif
% Mary Had a Little Lamb Sheet Music
% https://www.musicallthetime.com/images-songs/mary-had/mary-had-a-little-lamb-for-piano-simple.png

F = 369.63;
G = 391.63;
A = 440.66;
E = 329.62;
D = 293.67;
C = 261.63;

song = [];
song_2 = [];

%% Ode to Joy 
note_sine_waves = cell(1, 15);
note_sizes = zeros(1, 15);
note_frequencies = [F, F, G, A, A, G, F, E, D, D, E, F, F, E, E];

sample_indices = dur*fs;

%Create sine waves for each note
for i = 1:length(note_sine_waves)
    t = (0:sample_indices-1) / fs;
    note = amp *sin(-1*phase + 2 * pi * note_frequencies(i) * t); 
    note_sine_waves{i} = note;
    note_sizes(i) = length(note);
end

%Add notes to the song
for i = 1:length(note_frequencies)
    song = [song note_sine_waves{i}];
end

%Play the song
sound(song, fs);

audiowrite(strcat('Ode_to_Joy', '.wav'), song, fs);
pause(5)
%% Mary Had a Little Lamb
note_sine_waves = cell(1, 27);
note_sizes = zeros(1, 27);

note_frequencies = [E, D, C, D, E, E, E, D, D, D, E, G, G, E, D, C, D, E, E, E, E, D, D, E, D, C, C];

sample_indices = dur*fs;

%Create sine waves for each note
for i = 1:length(note_sine_waves)
    t = (0:sample_indices-1) / fs;
    note = amp *sin(-1*phase + 2 * pi * note_frequencies(i) * t); 
    note_sine_waves{i} = note;
    note_sizes(i) = length(note);
end

%Add notes to the song
for i = 1:length(note_frequencies)
    song_2 = [song_2 note_sine_waves{i}];
end

%Play the song
sound(song_2, fs);
audiowrite(strcat('Mary_Had_A_Little_Lamb', '.wav'), song_2, fs);
end
