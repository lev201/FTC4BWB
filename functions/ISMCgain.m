
function [K1, K2, K3, hat]=ISMCgain(S1, S2, A, B2, M, P2, yc);
%% Unit vector transform

A11=A{1,1}-A{1,2}*M;
A12=A{1,2}*inv(S2);
A21=M*A{1,1}+A{2,1}-A{2,2}*M;
A22=M*A{1,2}+A{2,2};


%% Gain calculations


for i=1:size(P2,1)
    phi(i)=-1/(2*P2(i,i));
end

PHI=diag([phi]);

B=eye(size(B2,1));
hat=S2*B;


Br=[eye(size(yc,1))
    zeros(size(S1,2)-size(yc,1),size(yc,1))];
K1=pinv(hat)*(-S2*A{2,1});
K2=pinv(hat)*-(S2*A{2,2}*inv(S2)-PHI);
K3=-S1*Br;

end