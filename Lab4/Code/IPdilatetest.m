img = imread('wirebondmask.tif');

figure;
imshow(img); 

%struct_elem = ones(3,3);
struct_elem = [0, 1, 1; 1 0 1; 1 0 0];

g = IPdilate(img, struct_elem);
g = logical(g);

g_matlab = imdilate(img, struct_elem);

[M, N] = size(g);

sum = 0;
for i = 1:M
    for j = 1:N
        sum = sum + abs(g(i, j) - g_matlab(i, j));
    end
end

sum

figure;
imshowpair(g, g_matlab, 'diff');

figure;
imshow(g);