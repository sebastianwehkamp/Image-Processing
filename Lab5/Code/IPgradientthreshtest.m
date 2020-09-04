img = imread('fingerprint.tif');

% Create 5 images without smoothing
for idx = 10:10:50
    figure;
    g = IPgradientthresh(img, idx);
    imshow(g);
end

% Create 5 images with smoothing
img = IPfilter(img, 1/9 * ones(3,3));

for idx = 10:10:50
    figure;
    g = IPgradientthresh(img, idx);
    imshow(g);
end