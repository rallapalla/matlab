function [ tdoa ] = tdoa( s1, s2, maxlag )
%TDOA Summary of this function goes here
%   Detailed explanation goes here

kk_tdoa = 0;    %Kreuzkorrelationswert des am bisher wahrscheinlichsten tdoa
tdoa = 0;       %der am bisher wahrscheinlichste tdoa
kk = 0;         %aktuell berechnete Kreuzkorrelation

for i = -maxlag:maxlag
    
    if i<0
        kk = sum(s1(1:length(s1)+i).*s2(1-i:end));
    elseif i==0
        kk = sum(s1.*s2);
    else
        kk = sum(s1(i+1:end).*s2(1:length(s2)-i));
    end;
    
    if abs(kk) > kk_tdoa
       
        tdoa = -i;
        kk_tdoa = abs(kk);
    
    end;
    
end;

end

