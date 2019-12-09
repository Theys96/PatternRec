function void = plot_fft(y, Fs, plt)
%PLOT_FFT Take a signal an present its FFT to the user in a diagram
    L = length(y);          % Series length
    T = L / Fs;             % Audio length in seconds
    Y = fft(y);
    Ylen = ceil((L+1)/2);   % Relevant series length
    amp = real(Y)/Ylen;
    figure(plt);
    plot((0:Ylen)/T, amp(1:Ylen+1));    
end

