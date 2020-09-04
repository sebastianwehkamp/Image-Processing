function [output_img] = IPdownsample(img, fac)
    img = im2double(img);
    [m, n] = size(img);
    %Create list of indices with steps of size fac
    m_ind = 1:fac:m;
    n_ind = 1:fac:n;
    
    %Using list of indices place the original pixels in a new image
    output_img = img(m_ind, n_ind);
end