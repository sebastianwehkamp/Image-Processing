function [g] = IPreduce(f, sigma)
    g = IPdownsample(imgaussfilt(f, sigma), 2);
end

%    %mask = fspecial('gaussian',3,sigma);
   % g = imresize(imgaussfilt(f, sigma), 0.5);
    %g = imresize(IPfilter(f, mask), 0.5);
    %g = im2double(g);
    
   