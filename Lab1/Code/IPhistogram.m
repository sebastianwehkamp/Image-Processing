function [h] = IPhistogram(img)
    img = im2double(img);
    img = img * 255;
    %Allocate space for histogram
    h=zeros(1, 256);
    index=1:1:256;
    %Count number of pixels for every gray value
    for n=1:256
        h(n) = length(find(img==n-1));
    end
    %Plot the histogram
    bar(index,h)
    ylim([0 100000]);
    title('Histogram of gray values')
    xlabel('gray values')
end
