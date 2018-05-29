function [S, S1, S2, M, E]=SQM(A, Q, p);

A_hat=A{1,1}-A{1,2}*inv(Q{2,2})*Q{2,1};

Q_hat=Q{1,1}-Q{1,2}*inv(Q{2,2})*Q{2,1};

P1=care(A_hat, A{1,2}, Q_hat);
M=inv(Q{2,2})*(A{1,2}'*P1+Q{2,1});

E=eig(A{1,1}-A{1,2}*M);
S2=eye(size(M,1));
S1=[S2*M];
S=[S1 S2];

end