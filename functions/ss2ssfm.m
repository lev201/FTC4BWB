function [ss]=ss2ssfm(ss);

[A, B, C, D]= ss2m(ss);

[nn, mm] = size (B);

[Tr temp]=qr(B);

Tr=Tr*fliplr(eye(nn));
Tr=Tr';

ss=ss2ss(ss, Tr);
end