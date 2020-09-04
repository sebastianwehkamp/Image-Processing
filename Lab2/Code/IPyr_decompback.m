function [g] = IPyr_decompback(f, J, s)
    f = im2double(f);
    M = size(f, 1);
    
    sum = 0;
    for idx = 1:3
        sum = sum + (0.5^(idx - 1));
    end
    P = M * sum;
    g = zeros(P, M);

    for idx = 1:J
        if idx <= J - 1
            d = f - IPexpand(IPreduce(f, s), s);
        else
            d = f;
        end
        f = IPreduce(f, s);
        
        g = d;
        figure;
        imshow(g)
    end
end

