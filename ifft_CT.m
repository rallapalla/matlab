function [ x ] = ifft_CT( X, M )
%IFFT_CT Summary of this function goes here
%   Detailed explanation goes here

    x = 1/M*conj(fft_CT(conj(X), M));

end

