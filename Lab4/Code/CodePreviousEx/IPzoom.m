function [output_img] = IPzoom(img, fac)
    img = im2double(img);
    %Replicate a pixel using the repelem function
    output_img = repelem(img, fac, fac);
end
