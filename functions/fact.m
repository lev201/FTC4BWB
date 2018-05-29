function [B2 Bv]= fact(B)

[nn, mm] = size (B);
ncols = size(1,nn);

p=0;
Br=round(B,5);

for i = 1:nn
    if Br(i,:) == zeros(1, size(B,2))
        p=p+1;
    else
        p=p;
    end
end

B2=Br(nn-(nn-p-1):nn, 1:mm);

Bv=[zeros(size(B,1)-size(B2,1), size(B2,1)); eye(size(B2,1))];
    
    

