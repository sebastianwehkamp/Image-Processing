function [g] = IPhighboost_freq3 (f, k)
<<<<<<< HEAD
% [G] = LAPLACE_FD(F) performs laplace filtering
% in the Fourier domain. Kernel h=[0 1/5 0; 1/5 1/5 1/5; 0 1/5 0]
% Zero padding is applied to avoid boundary overlap effects
M=size(f,1); N=size(f,2); % nr of rows/columns of image f
C=15; D=15; % nr of rows/columns of kernel h
P=M+C-1; Q=N+D-1; % nr of rows/columns after padding
=======
    % Kernel h=[0 1/5 0; 1/5 1/5 1/5; 0 1/5 0]
    % Zero padding is applied to avoid boundary overlap effects
    M=size(f,1); N=size(f,2); % nr of rows/columns of image f
    C=3; D=3; % nr of rows/columns of kernel h
    P=M+C-1; Q=N+D-1; % nr of rows/columns after padding
>>>>>>> 648fea0c2a6eab9df5a5dbb8f1b06b8446c0e545

    rfloor = floor(P/2); rceil = ceil(P/2); % midpoint along rows
    cfloor = floor(Q/2); cceil = ceil(Q/2); % midpoint along columns
    u = -rfloor:rceil-1; % centered vector along rows
    v = -cfloor:cceil-1; % centered vector along columns
    [V,U] = meshgrid(v,u); % create mesh of size P x Q

    % The frequency domain transfer function of the smoothing ?lter (centered around (0,0)) 
    Hc = 1/5 + 2/5*cos(2*pi*U/P) + 2/5*cos(2*pi*V/Q); 
    H = ifftshift(Hc); % centered at corner (1,1)

    fp=zeros(P,Q); % zero padding: start with zeroes
    fp(1:M,1:N)=f; % insert f into image fp
    Fp=fft2(double(fp), P, Q); % FFT of image fp

    Hp = k + 1 - k * H;
    Gp = Hp .* Fp; % Product of FFTs

<<<<<<< HEAD
gp=ifft2(Gp); % Inverse FFT
gp=real(gp); % Take real part
g=gp(1:M, 1:N); % Undo zero padding

imshow(g, [min(g(:)) max(g(:))]);
%imagesc(g)
%colormap(gray); 
=======
    gp=ifft2(Gp); % Inverse FFT
    gp=real(gp); % Take real part
    g=gp(1:M, 1:N); % Undo zero padding
    
    % Plot the image 
    % Force the image to use the lowest value as black and highest as white
    imshow(g, [min(g(:)) max(g(:))]);
end
>>>>>>> 648fea0c2a6eab9df5a5dbb8f1b06b8446c0e545

