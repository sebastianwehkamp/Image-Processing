img = imread('plant.tif');

figure;
imshow(img);

res = IPpyr_decomp(img, 3, 5);

figure;
imshow(res);