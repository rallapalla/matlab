function [ symbols ] = bits_to_symbols( bits, M )

    if M ~= 2 && M ~= 4 && M ~= 8 && M ~= 16
       error('M has to equal 2, 4, 8 or 16');
    end
    
    if mod(length(bits), log2(M)) ~= 0
        error('length of bits has to equal a multiple of log2(M)');
    end

    symbols = zeros(1,length(bits)/log2(M));
    count = 1;
    
    switch M
        case 2
            
            symbols = bits*2-1;
            
        case 4
            
            for i = (1:log2(M):length(bits)-log2(M)+1)
                if      bits(i) == 0 && bits(i+1) == 0
                    symbols(count) = 1;
                end
                if  bits(i) == 0 && bits(i+1) == 1
                    symbols(count) = 1i;
                end
                if  bits(i) == 1 && bits(i+1) == 0
                    symbols(count) = -1i;
                end
                if  bits(i) == 1 && bits(i+1) == 1
                    symbols(count) = -1;
                end
                count = count+1;
            end
            
        case 8
            
            for i = (1:log2(M):length(bits)-log2(M)+1)
                symbols(count) = 1;
                
                if  bits(i) == 0 && bits(i+1) == 0 && bits(i+2) == 0
                    symbols(count) = symbols(count) * exp(1i*pi*0);
                end
                if  bits(i) == 0 && bits(i+1) == 0 && bits(i+2) == 1
                    symbols(count) = symbols(count) * exp(1i*pi*1/4);
                end
                if  bits(i) == 0 && bits(i+1) == 1 && bits(i+2) == 1
                    symbols(count) = symbols(count) * exp(1i*pi*2/4);
                end
                if  bits(i) == 0 && bits(i+1) == 1 && bits(i+2) == 0
                    symbols(count) = symbols(count) * exp(1i*pi*3/4);
                end
                if  bits(i) == 1 && bits(i+1) == 1 && bits(i+2) == 0
                    symbols(count) = symbols(count) * exp(1i*pi*4/4);
                end
                if  bits(i) == 1 && bits(i+1) == 1 && bits(i+2) == 1
                    symbols(count) = symbols(count) * exp(1i*pi*5/4);
                end
                if  bits(i) == 1 && bits(i+1) == 0 && bits(i+2) == 1
                    symbols(count) = symbols(count) * exp(1i*pi*6/4);
                end
                if  bits(i) == 1 && bits(i+1) == 0 && bits(i+2) == 0
                    symbols(count) = symbols(count) * exp(1i*pi*7/4);
                end
                
                count = count+1;
            end
            
        case 16
            for i = (1:log2(M):length(bits)-log2(M)+1)
                symbols(count) = bits(i)*2-1 + (bits(i+1)*2-1)*1i + 2*(bits(i+2)*2-1) + 2*(bits(i+3)*2-1)*1i;
                count = count+1;
            end
    end
    
    symbols = symbols/sqrt(sum(symbols .* conj(symbols))/length(symbols));
   
    
end