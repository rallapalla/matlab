function [ bits ] = symbols_to_bits( symbols, M )

    % init empty bitvector
    bits = zeros(1,length(symbols)*log2(M));

    % norm Symbols
    symbols = symbols/sqrt(sum(symbols .* conj(symbols))/length(symbols));

    %initialize Table for bit-symbol relationship
    rel = cell(2,M);
    
    %fill Table with bitvectors
    for i = 1:M
       val = i-1;
       rel{1,i} = zeros(1,log2(M));
       for j = log2(M)-1:-1:0
           if val >= 2^j
               rel{1,i}(j+1) = 1;
               val = val-2^j;
           end
       end
    end
    
    %get corresponding symbol and save in Table
    for i = 1:M
       rel{2,i} = bits_to_symbols(rel{1,i}, M);
    end
    
    %compare received and defined symbol
    for i = 1:length(symbols)
        dist = inf;
        for j = 1:M
            if abs(symbols(i)-rel{2,j}) < dist
                dist = abs(symbols(i)-rel{2,j});
                bits((i-1)*log2(M)+1:(i-1)*log2(M)+log2(M)) = rel{1,j};
            end
        end
    end

end

