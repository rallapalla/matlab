clear all;
close all;

M = 2^15;
f1 = 3000;
f2 = 10000;



t = linspace(0,1,M);

x = cos(2*pi*f1*t)+cos(2*pi*f2*t);

%x = zeros(1,M);
%x(1,1) = 1;

X = fft_CT(x, M);

Xabs = abs(X);

y = ifft_CT(X, M); 

yabs = abs(y);

plot(x); 

figure;

plot(Xabs);

figure;

plot(yabs);