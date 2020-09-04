function [g] = IPhighboost (img, k)
    %Set filter h_smooth
    filter = [0 1/5 0; 1/5 1/5 1/5; 0 1/5 0];
    %Apply smoothing function of lab1
    f_smooth = IPfilter(img, filter);
    %Calculate g_mask
    g_mask = img - f_smooth;
    %Calculate g using equation 1 from the assignment
    g = img + k * g_mask;
    imshow(g)
end