function [As, Bs, Br, S1, S2] = uvti(Ap, Bp, S, yc)
[nn, mm] = size (Bp);

p=0;
Br=round(Bp,5);

for i = 1:nn
    if Br(i,:) == zeros(1, size(Br,2))
        p=p+1;
    else
        p=p;
    end
end

S1=S(1:size(S,1), 1:p);
S2=S(1:size(S,1), p+1:size(S,2));

Ts=[eye(size(S1,2)) zeros(size(S1,2), size(S2,1))
    S1               S2];

As=Ts*Ap*inv(Ts);
Bs=Ts*Bp;

Br=[eye(size(yc,1))
    zeros(p-size(yc,1),size(yc,1))];
end