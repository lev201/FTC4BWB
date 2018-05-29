function [S, E]=SQM(A, B, Q);

nn=size(A,1);
[A,B]=stdfrm(A, B);
[A B p]=parti(A, B);

Q11=Q(1:p-1, 1:p-1);
Q12=Q(1:p-1, p:nn);
Q21=Q(p:nn, 1:p-1);
Q22=Q(p:nn, p:nn);

A_hat=A{1,1}-A{1,2}*inv(Q22)*Q21;

Q_hat=Q11-Q12*inv(Q22)*Q21;

P1=care(A_hat, A{1,2}, Q_hat);
M=inv(Q22)*(A{1,2}'*P1+Q21);

E=eig(A{1,1}-A{1,2}*M);
S2=eye(p);
S1=[S2*M];
S=[S1 S2];

end