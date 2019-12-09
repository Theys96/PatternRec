function y_out = filter_freq(y, Fs, freq, delta)
%FILTER_FREQ Filter a specific frequency out of an audio signal
    [b,a] = butter(3, [(freq-delta)/(Fs/2) (freq+delta)/(Fs/2)], 'stop');
    y_out = filter(b,a,y);
end

