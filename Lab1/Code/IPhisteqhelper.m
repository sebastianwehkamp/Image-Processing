function [s_k] = IPhisteqhelper(img,i,j,h)
    [m, n] = size(img);
    
    % Number of pixels in original image
    N = m * n;
    
    % Compute original intensity of image
    gl = img(i,j) * 255;
    
    % (L - 1) / number of pixels * sum of number of pixels
    % up till and including that intensity in the original image
    s_k = 255 / N * sum(h(1:gl+1));
  
    % Round to nearest integer
    s_k = round(s_k);    
end
