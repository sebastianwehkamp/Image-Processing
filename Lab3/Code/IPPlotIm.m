% Scale values between 0 and 1
minV = min(originalIm(:));
maxV = max(originalIm(:));

originalIm = originalIm - minV;
originalIm = originalIm / (maxV - minV);


subplot(1,3,1)
imshow(originalIm)
subplot(1,3,2)
imshow(reconIm)
subplot(1,3,3)
dif = abs(originalIm-reconIm)
colormap(gray)
imagesc(dif)
axis off;