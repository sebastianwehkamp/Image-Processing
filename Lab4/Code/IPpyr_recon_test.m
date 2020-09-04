% Specify reconstruction level
K = 1;

% Read original image
image = imread('plant.tif');
image = im2double(image);

% Apply scaling to original image
minV = min(image(:));
maxV = max(image(:));
image = image - minV;
image = image / (maxV - minV);

% Decompose the image
g = IPpyr_decomp(image, 3, 1);

% Reconstruct the image with specified level K
g2 = IPpyr_PartRecon(g, 3, K, 1);

% Compute difference image
dif = abs(g2 - image);

% Plot images properly
subplot(1,3,1);
imshow(image);
subplot(1,3,2);
imshow(g2);
subplot(1,3,3);
colormap(gray);
imagesc(dif);
axis off;

% Compute the error
sum_diff = 0;

for i = 1:N
    for j = 1:N
        diff = abs(g2(i, j) - image(i, j));
        sum_diff = sum_diff + diff;
    end
end

error = sum_diff / (M * N)