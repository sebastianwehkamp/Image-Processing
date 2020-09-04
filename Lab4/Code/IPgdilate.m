function [dilation] = IPgdilate(image,structEl)
    [M,N] = size(image);
    image = im2double(image);
    
    % Pad image by 1 row and column on each side. 
    % Needed since the origin is in center of image
    % Padding with 1 is necessary since we intend to dilate
    % This means that we would like to match as much as possible
    paddedIm = padarray(image,[1,1], 1);
    dilation = zeros(M,N);
    
    for i=1:M 
        for j=1:N 
            % As described in the book we need to take the maximum
            % value of each value in the region image coincident
            % with the structuring element.
            padded = paddedIm(i:i+2,j:j+2);
            max_elem = max(max(padded .* structEl));
            dilation(i,j) = max_elem;
        end
    end
end


