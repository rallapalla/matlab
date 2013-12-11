function [ X ] = fft_CT( x, M )
%FFT_CT Summary of this function goes here
%   Detailed explanation goes here

    % fill x with zeros or cut to length M
    x(M+1) = 0;
    x = x(1:M);

    
    
    if M > 1
        
        x1 = x(1:M/2);
        x2 = x(M/2+1:end);
        
        X = zeros(size(x));
        W_M_k = zeros(size(x1));
        
        W_M_k(1:1:end) = exp(-2i*pi*(0:1:M/2-1)/M);
        
        X(1:2:end) = fft_CT(x1 + x2, M/2);
        X(2:2:end) = fft_CT((x1 - x2).*W_M_k, M/2);
        
%         U = fft_CT(x(1:2:end), M/2); %recursive function call
%         V = fft_CT(x(2:2:end), M/2);
%         
%         X = zeros(size(x));
%         for n = 1:M
%             if n > M/2
%                 X(n) = U(n-M/2) + exp(-2i*pi*n/M) * V(n-M/2);
%             else
%                 X(n) = U(n) + exp(-2i*pi*n/M) * V(n);
%             end;
%         end;
 
    else
        X = x;
    end;
    
   
end

