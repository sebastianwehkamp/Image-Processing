function [g] = IPgradientthresh(f,p)
    f = im2double(f);
    [M, N] = size(f);
    % Create an all ones matrix
    padded = ones(M + 1, N + 1); 
    % Create a padded version of the image
    padded(1:M, 1:N) = f;
    % allocate space for the new image
    g = zeros(M, N);
    for i = 1:M
        for j = 1:N
            % Compute |fx|
            abs_x = abs(padded(i + 1, j) - padded(i, j));
            % Compute |fy|
            abs_y = abs(padded(i, j + 1) - padded(i, j));
            % Compute g
            g(i, j) = abs_x + abs_y;
        end
    end
    % Normalization (force values to be within 0 and 1)
    minV = min(g(:));
    maxV = max(g(:));

    g = g - minV;
    g = g / (maxV - minV);

    % Compute threshold
    p = p/100*max(max(g));
    
    % Apply threshold
    g(g < p) = 0;
    g(g >= p) = 1;
end

