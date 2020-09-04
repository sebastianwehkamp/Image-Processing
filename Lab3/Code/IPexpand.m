function [g] = IPexpand(f, sigma)
    g = imgaussfilt(IPzoom(f, 2), sigma);
end

%%mask = fspecial('gaussian',3,sigma);
    %g = IPfilter(IPzoom(f, 2), mask);
    %g = imresize(imgaussfilt(f, sigma), 0.5);
    %g = im2double(g);