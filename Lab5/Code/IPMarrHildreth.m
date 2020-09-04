function [g] = IPMarrHildreth (f, sigma, p)
    % Apply uniform filtering
    f = IPfilter(f, 1/9 * ones(3,3));
    % Zero padding is applied to avoid boundary overlap effects
    M=size(f,1); N=size(f,2); % nr of rows/columns of image f
    C = 6 * sigma; D = 6 * sigma; % nr of rows/columns of kernel h
    
    if mod(C, 2) == 0
        C = C + 1;
        D = D + 1;
    end 
    P=M+C-1; Q=N+D-1; % nr of rows/columns after padding
    fp=zeros(P,Q); % zero padding: start with zeroes
    fp(1:M,1:N)=f; % insert f into image fp
    hp=zeros(P,Q); % Construct filter matrix hp, same size as fp.
    
    % Compute mask with formula
    for i = 1:C
        for j = 1:D
            x = -ceil(C / 2) + i;
            y = -ceil(D / 2) + j;
            LoG_val = -2.0 / (pi * sigma^4) ...
                * (1.0 - ((x * x + y * y) / (2.0 * sigma^2))) ...
                * exp((-(x * x + y * y) / (2.0 * (sigma^2))));
            hp(i, j) = LoG_val;
        end
    end

    % Shift mask over image
    hp = circshift(hp, [-floor(C / 2), -floor(D / 2)]);

    % Convert to frequency space for efficient convolution
    Fp=fft2(double(fp), P, Q); % FFT of image fp
    Hp=fft2(double(hp), P, Q); % FFT of kernel hp

    % Perform convofultion
    Gp = Hp .* Fp;

    % Return to spatial domain
    gp=ifft2(Gp); % Inverse FFT
    gp=real(gp); % Take real part
    g=gp(1:M, 1:N); % Undo zero padding
    
    % Compute threshold
    p = p/100*max(max(g));
    
    % Apply threshold
    g(g < p) = 0;
    g(g >= p) = 1;
    
    % Scale image back
    minV = min(g(:));
    maxV = max(g(:));

    g = g - minV;
    g = g / (maxV - minV);
        
    % Plot the image 
    imshow(g);
end