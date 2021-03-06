M = 16;
rel = cell(2,M);

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