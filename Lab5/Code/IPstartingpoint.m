% Determine starting location
function [x, y] = IPstartingpoint (f)
    [M, N] = size(f);
    for i = 1:M
        for j = 1:N
            if f(i, j) == 1
                x = i;
                y = j;
                return
            end
        end
    end
end