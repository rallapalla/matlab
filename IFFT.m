clear all;
close all;

M = 2^15;

X = ones(1,M);

x = ifft_CT(X, M);


plot(x);