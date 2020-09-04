function [erosion] = IPerode(image,structEl)
    [M,N] = size(image);
    
    % Pad with 1s since we want to match as much as possible with our 
    % structuring element (eroding). This is also Matlabs convention.
    paddedIm = padarray(image,[1,1], 1);
    erosion = zeros(M,N);
    for i=1:M 
        for j=1:N 
            padded = paddedIm(i:i+2,j:j+2);
            erosion(i,j)= isequal(structEl, padded .* structEl);
        end
    end
end

