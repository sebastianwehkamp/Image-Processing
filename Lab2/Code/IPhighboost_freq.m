function [g] = IPhighboost_freq (img, k)

    % Size of image
    [M, N] = size(img);

    % Filter
    h = [0 1/5 0; 1/5 1/5 1/5; 0 1/5 0];

    % Compute size of bigger image taking into account mask (img + mask -
    % 1)
    P = M + size(h,1) - 1;
    Q = N + size(h,2) - 1;

    % Pad X with zeroes
    xPadded = img;
    xPadded(P, Q) = 0;

    % Pad Y with zeroes
    hPadded = h;
    hPadded(P,Q) = 0;

    % Shift the mask such that it lives on the correct location 
    hShifted = circshift(hPadded, [-1 -1]);

    % Go to frequency domain)
    H = fft2(hShifted);
    X = fft2(xPadded);

    % Convolution is the same as multiplication in the freq domain.
    Y = H .* X;
    
    % Obtain the mask
    mask = X - Y;
    
    % Enhance the image k times
    g = X + k * mask;

    % Go back to time domain
    y = ifft2(g);

    % Crop away part of the image due to the mask that was appended
    % initially
    yCropped = y(1:M, 1:N);
   
    % Force the image to use the lowest value as black and highest as white
    imshow(yCropped, [min(yCropped(:)) max(yCropped(:))]);