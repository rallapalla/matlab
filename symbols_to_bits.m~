function [ bits ] = symbols_to_bits( symbols, M )

bits = zeros(1,length(symbols)*log2(M));
symbols = symbols/sqrt(sum(symbols .* conj(symbols))/length(symbols));
scatterplot(symbols);
switch M
    case 2
        for i = 1:length(symbols)
            if real(symbols(i)+1i) >= 0
                bits(i) = 1;
            else
                bits(i) = 0;
            end
        end
    case 4
        for i = 1:length(symbols)
           phi = angle(symbols(i));
           if (phi >= 0 && phi < pi*1/4) || (phi >= pi*7/4 && phi < pi*8/4)
               bits((i-1)*2+1) = 0;
               bits((i-1)*2+2) = 0;
           end
           if phi >= pi*1/4 && phi < pi*3/4
               bits((i-1)*2+1) = 0;
               bits((i-1)*2+2) = 1;
           end
           if phi >= pi*3/4 && phi < pi*5/4
               bits((i-1)*2+1) = 1;
               bits((i-1)*2+2) = 1;
           end
           if phi >= pi*5/4 && phi < pi*7/4
               bits((i-1)*2+1) = 1;
               bits((i-1)*2+2) = 0;
           end
        end
    case 8
        for i = 1:length(symbols)
           phi = angle(symbols(i));
           if phi < 0
               phi = phi+2*pi;
           end
           if (phi >= 0 && phi < pi*1/8) || (phi >= pi*15/8 && phi < pi*16/8)
               bits((i-1)*3+1) = 0;
               bits((i-1)*3+2) = 0;
               bits((i-1)*3+3) = 0;
           end
           if phi >= pi*1/8 && phi < pi*3/8
               bits((i-1)*3+1) = 0;
               bits((i-1)*3+2) = 0;
               bits((i-1)*3+3) = 1;
           end
           if phi >= pi*3/8 && phi < pi*5/8
               bits((i-1)*3+1) = 0;
               bits((i-1)*3+2) = 1;
               bits((i-1)*3+3) = 1;
           end
           if phi >= pi*5/8 && phi < pi*7/8
               bits((i-1)*3+1) = 0;
               bits((i-1)*3+2) = 1;
               bits((i-1)*3+3) = 0;
           end
           if phi >= pi*7/8 && phi < pi*9/8
               bits((i-1)*3+1) = 1;
               bits((i-1)*3+2) = 1;
               bits((i-1)*3+3) = 0;
           end
           if phi >= pi*9/8 && phi < pi*11/8
               bits((i-1)*3+1) = 1;
               bits((i-1)*3+2) = 1;
               bits((i-1)*3+3) = 1;
           end
           if phi >= pi*11/8 && phi < pi*13/8
               bits((i-1)*3+1) = 1;
               bits((i-1)*3+2) = 0;
               bits((i-1)*3+3) = 1;
           end
           if phi >= pi*13/8 && phi < pi*15/8
               bits((i-1)*3+1) = 1;
               bits((i-1)*3+2) = 0;
               bits((i-1)*3+3) = 0;
           end
        end
    case 16
        rel = cell(2,M);
        for i = 1:M
           rel(1,i) = [ 0 0 0 ]; 
        end
end



end

