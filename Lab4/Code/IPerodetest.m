img = imread('wirebondmask.tif');

figure;
imshow(img); 

struct_elem = ones(3,3);
%struct_elem = [1 1 0; 1 0 1; 1 0 0;];

g = IPerode(img, struct_elem);
g = logical(g);

g_matlab = imerode(img, struct_elem);

[M, N] = size(g);

sum = 0;
for i = 1:M
    for j = 1:N
        diff = abs(g(i, j) - g_matlab(i, j));
        sum = sum + diff;
    end
end

sum

imshowpair(g, g_matlab, 'diff');

figure;
imshow(g);