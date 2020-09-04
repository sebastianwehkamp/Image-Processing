function [] = IPfourierdesc (f, P)
    % Get contour values
    [X,Y] = IPcontour(f);
    % convert to complex
    S_k = complex(X, Y);
    % Perform FFT
    d_f = fft(S_k);
    
    % Set all values to zero except for DC component (center) and the
    % lowest P frequencies
    center = round(length(S_k) / 2);
    range = round(center - P/2);
    for idx = 1:range
        d_f(center - idx + 1) = 0;
        d_f(center + idx + 1) = 0;
    end
    
    % Inverse fourier transform
    d_f = ifft(d_f);
    
    % Plot the result
    plot(round(real(d_f)), round(imag(d_f)),'g','LineWidth',1);
end