function [A, B, Tr] = stdfrm(A, B)

[nn, mm] = size (B);

[Tr temp]=qr(B);
Tr=Tr*fliplr(eye(nn));
Tr=Tr';

A=Tr*A*Tr';
B=Tr*B;

end
