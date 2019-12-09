[y, Fs] = audioread('corrupted_voice.wav');

plot_fft(y, Fs, 1);

fltrd_y = filter_freq(filter_freq(y, Fs, 100, 20), Fs, 6000, 50);

plot_fft(fltrd_y, Fs, 2);

audiowrite('filtered_voice.wav', fltrd_y, Fs);

