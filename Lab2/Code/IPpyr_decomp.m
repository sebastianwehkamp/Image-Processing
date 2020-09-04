% INPUT: image f, level J, sigma s
% OUTPUT: resulting laplacian pyramid image g, 
% gaussian pyramid images G, 
% laplacian images L

function [g, G, L] = IPpyr_decomp(f, J, s)
    f = im2double(f);
    M = size(f, 1);
    
    sum = 0;
    
    % Determine the height of the resulting image
    for idx = 1:J
        sum = sum + (0.5^(idx - 1));
    end
  
    P = M * sum;
    
    % Construct the matrix
    g = ones(P, M);

    % Gaussian pyramid
    G{1} = f;
    for idx = 1:J - 1
        f = IPreduce(f, s);
        G{idx + 1} = f;
    end
    
    % Use the size of the output image to determine where
    % each L_n image should be placed
    [g_h, g_w] = size(g);
    offsetY = 0;
    
    % Expand the guassian images and subtract it from the original G_n
    for idx = 1:J
        if (idx == 1)
            f =  G{J - idx + 1};
        else      
            G{J - idx + 1}
            IPexpand(G{J - idx + 2}, s)
            f =  G{J - idx + 1} - IPexpand(G{J - idx + 2}, s);
        end
        
        % Store Laplacian images
        L{idx} = f;

        [p, q] = size(f);
        offsetY = offsetY + p;
        
        % Compute where the image should be placed in the resulting image
        height =  g_h - offsetY + 1 : g_h - offsetY + p;
        width = g_w / 2 - 0.5 * p + 1: g_w / 2 + 0.5 * p;
        g(height, width) = f;
     end
end

