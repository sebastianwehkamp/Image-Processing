function [output_img] = IPupsample(img, fac)

    img = im2double(img);

    [m, n] = size(img);
    
    % Initialize with 0s.
    output_img = zeros(m * fac - (fac - 1), n * fac - (fac - 1));
    
    % Put the original values back in taking into account the 0s.
    output_img(1:fac:end,1:fac:end) = img(:,:);
end
