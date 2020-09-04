% INPUT: laplacian pyramid g, level J, sigma s
% OUTPUT: reconstructed image im

function [im] = IPpyr_recon(g, J, s)
    g = im2double(g);
    [M, N] = size(g);
    
    current_height = 1;    
    sz = N;
    
    center = N / 2;
    G = {};
    
    % Convert the pyramid to a list of images G
    for idx = 1:J
        height_pos = current_height:current_height + sz - 1;
        width_pos = center - (0.5 * sz) + 1 : center + (0.5 * sz);
        G{idx} = g(height_pos, width_pos);
        current_height = current_height + sz;
        sz = sz / 2;
    end
    
    % Set starting image to bottom level of pyramid
    im = G{J};
    
    % For every level expand the image and add the differences
    for idx = 1:J-1
        im = IPexpand(im, s) + G{J-idx};
    end

    % Scale values between 0 and 1
    minV = min(im(:));
    maxV = max(im(:));
    
    im = im - minV;
    im = im / (maxV - minV);
    
    imshow(im);
end

