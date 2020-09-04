function [erosion] = IPgerode(image,structEl)
    % Similar implementation but now using the duality property.
    % This states that eroding is the same as performing dilation with
    % an inverted image and a rotated (180 degrees) structuring element
    image_comp = imcomplement(image);
    structEl_rot = rot90(structEl, 2);

    erosion = IPgdilate(image_comp, structEl_rot);
    
    % Invert image back to original "color"
    erosion = imcomplement(erosion);
end

