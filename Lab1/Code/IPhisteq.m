function [new_img] = IPhisteq(img)

    [m,n] = size(img);
    d_img = im2double(img);
    %Create histogram
    h = IPhistogram(d_img);
    %Allocate space for new image
    new_img = zeros(m,n);
    for i=1:m
        for j=1:n
            %Apply formula 3.3-8 from the Image Processing book
            new_img(i,j) = IPhisteqhelper(d_img,i,j,h);
        end
    end
    new_img = uint8(new_img);
end
