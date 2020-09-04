function [g] = IPbwtraceboundary (f)
    f = padarray(f, [1 1]);
    [b_j, b_i] = IPstartingpoint(f);
    
    [M, N] = size(f);
    g = zeros(M, N);
    
    % Maintain the starting position. This is needed to terminate the
    % algorithm
    g(b_j, b_i) = 1;
    start_i = b_i;
    start_j = b_j;
    
    % positions to check relative from b. 
    % This array is shifted after each update
    % to start at the next position clockwise from c.  
    indices = [-1 -1; 0 -1; 1 -1; 1 0; 1 1; 0 1; -1 1; -1 0];
    
    % check to store the next position b1 (needed for terminating)
    second = 1;
    
    loop = 1;
    while loop
        for i = 1:size(indices)
            if f(b_j + indices(i, 2), b_i + indices(i,1)) == 1
                
                % update b when we found a 1. 
                b_i = b_i + indices(i, 1);
                b_j = b_j + indices(i, 2);
                
                % store the next b right after the starting state
                if (second) 
                    b_i2 = b_i;
                    b_j2 = b_j;
                    second = 0;
                end
                
                % set position b in resulting image to 1
                g(b_j, b_i) = 1;
                
                % shift such that next position is clockwise of c
                % where c is the position right before entering a 1 pixel. 
                indices = circshift(indices, -(i - 2) + 1);

                % check if state (b0) is equal to starting state
                if (b_i == start_i && b_j == start_j)
                    for j = 1:size(indices)
                        % find the first next pixel having value 1
                        if f(b_j + indices(j, 2), b_i + indices(j,1)) == 1

                            b_i = b_i + indices(j, 1);
                            b_j = b_j + indices(j, 2);
                            % check if the next b is also equal to the 
                            % b obtained right after the starting state.
                            if (b_i == b_i2 && b_j == b_j2)
                                loop = 0;
                            end
                            break;
                        end
                    end
                end
                break;
            end
        end
        
    end
    % unpad
    g = g(2:end-1,2:end-1);
end
