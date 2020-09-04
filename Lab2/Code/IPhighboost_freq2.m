function [g] = IPhighboost_freq2 (f, k)
    % Kernel h=[0 1/5 0; 1/5 1/5 1/5; 0 1/5 0]
    % Zero padding is applied to avoid boundary overlap effects
    M=size(f,1); N=size(f,2); % nr of rows/columns of image f
    C=3; D=3; % nr of rows/columns of kernel h
    P=M+C-1; Q=N+D-1; % nr of rows/columns after padding
    fp=zeros(P,Q); % zero padding: start with zeroes
    fp(1:M,1:N)=f; % insert f into image fp
    hp=zeros(P,Q); % Construct filter matrix hp, same size as fp.
    hp(1,1)=1/5; hp(2,1)=1/5; hp(1,2)=1/5; % Center is at (1,1)
    hp(P,1)=1/5; hp(1,Q)=1/5; % Indices modulo P or Q
    Fp=fft2(double(fp), P, Q); % FFT of image fp
    Hp=fft2(double(hp), P, Q); % FFT of kernel hp

    % Apply transfer function
    Hp = k + 1 - k * Hp;
    Gp = Hp .* Fp;

    gp=ifft2(Gp); % Inverse FFT
    gp=real(gp); % Take real part
    g=gp(1:M, 1:N); % Undo zero padding
    
    % Plot the image 
    % Force the image to use the lowest value as black and highest as white
    imshow(g, [min(g(:)) max(g(:))]);
end
