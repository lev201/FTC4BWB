function [Ai, Bi, Ci] = ss2im(A, B, C, yc)

[nn, mm] = size (B);

[Areg Breg Tr]=stdfrm(A,B);

Cc=zeros(size(yc,1), size(C,2));

for i=1:size(yc,1)
    Cc(i,:)=C(yc(i),:);
end

Ci=Cc*inv(Tr);

Ai=[zeros(size(Ci,1), size(Ci,1) ) -Ci
    zeros(size(Ci,2), size(Ci,1)) Areg];

Bi=[zeros(size(Ci,1), size(Breg,2)) 
    Breg];

end