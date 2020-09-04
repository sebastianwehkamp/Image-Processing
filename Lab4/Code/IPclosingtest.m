img = imread('vase.tif');

% Show original image
figure;
imshow(img); 

% Define a structuring element
struct_elem = ones(3, 3);

g = IPgdilate(img, struct_elem);
g = IPgerode(g, struct_elem);

% Normalization (force values to be within 0 and 1)
minV = min(g(:));
maxV = max(g(:));

g = g - minV;
g = g / (maxV - minV);
    
% Visualize result
figure;
imshow(g);
