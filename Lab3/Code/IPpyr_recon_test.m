res = load('pyramid.mat');
res = res.res;

original_image = imread('plant.tif');
original_image = im2double(original_image);

g2 = IPpyr_recon(res, 3, 1.0);

figure;
subplot(1,2,1), imshow(original_image);
subplot(1,2,2), imshow(g2);

[M, N] = size(g2);

sum_diff = 0;

for i = 1:N
    for j = 1:N
        diff = abs(g2(i, j) - original_image(i, j));
        sum_diff = sum_diff + diff;
    end
end

error = sum_diff / (M * N)