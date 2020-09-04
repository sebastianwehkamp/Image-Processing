function [spect] = FFTTest()
    img = zeros(100);
    img(10, 10) = 255;
    spect = fft2(img);
end