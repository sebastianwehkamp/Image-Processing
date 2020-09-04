function [g] = IPfilter (f, filter)
    A = im2double(f); % convert image to double
    nr = size(A,1); % number of rows
    nc = size(A,2); % number of columns
    % Shift A cyclically in four directions
    A_up = [A(2:nr,:); A(1,:)]; % one row up
    A_down = [A(nr,:); A(1:nr-1,:)]; % one row down
    A_left = [A(:,2:nc) A(:,1)]; % one column to left
    A_right = [A(:,nc) A(:,1:nc-1)]; % one column to right

    % Shift A cyclically in other 4 diagonal directions
    A_down_right = circshift(A, [1 1]);
    A_up_right = circshift(A, [-1 1]); 
    A_up_left = circshift(A, [-1 -1]); 
    A_down_left = circshift(A, [1, -1]); 

    B = filter(2,2) * A + filter(1,2) * A_up + filter(3,2) * A_down ... 
    + filter(2,1) * A_left + filter(2,3) *  A_right ...
    + filter(3,3) * A_down_right + filter(1,3) * A_up_right ...
    + filter(1,1) * A_up_left + filter(3,1) * A_down_left;

    g = im2uint8(B); % convert to 8-bit
end
