
function [K1, K2, hat]=SMCgain(S, A, B, M, P2);
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

hat=S2*B{2};

K1=pinv(hat)*(-S2*As{2,1});
K2=pinv(hat)*-(S2*As{2,2}*inv(S2)-PHI);

end
