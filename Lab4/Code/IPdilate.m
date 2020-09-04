function [dilation] = IPdilate(image,structEl)
    % Similar implementation but now using the duality property.
    % This states that dilating is the same as performing erosion with
    % an inverted image and a rotated (180 degrees) structuring element
    image_comp = imcomplement(image);
    structEl_rot = rot90(structEl, 2);

    dilation = IPerode(image_comp, structEl_rot);
    
    % Invert image back to original "color"
    dilation = imcomplement(dilation);
end

