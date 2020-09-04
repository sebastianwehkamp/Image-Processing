img = imread('fingerprint.tif');

%img = IPfilter(img, 1/9 * ones(3,3));

images = cell(40,1);

for idx = 10:50
    g = IPgradientthresh(img, idx);
    images{idx - 9} = uint8(g);
end

 % create the video writer with 1 fps
 writerObj = VideoWriter('gradient_no_filter.avi');
 writerObj.FrameRate = 10;
 % set the seconds per image
 secsPerImage = ones(1,41) * 1;
 % open the video writer
 open(writerObj);
 bw = colormap(gray(2));
 % write the frames to the video
 for u=1:length(images)
     % convert the image to a frame
     frame = im2frame(images{u}, bw);
     for v=1:secsPerImage(u) 
         writeVideo(writerObj, frame);
     end
 end
 % close the writer object
 close(writerObj);