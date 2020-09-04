function [g] = IPlaplacian (f)
    filter = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    %filter = [1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];
    
    %Apply the filter
    g = IPfilter(f, filter);
end