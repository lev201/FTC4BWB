%ul(t)=hat^-1(-S2*A21_bar*x1(t)-(S2*A22_bar*S2^-1-PHI)*s(t))

%   K1=    hat^-1*-S2*A21_bar
%   K2=    hat^-1*S2*A22_bar*S2^-1-PHI
%   
%    A=    system matrix (n*n)
%    S=    sliding surface (n*m)
%  -Im=    P2*PHI+PHI'P2
%    s=    Sx(t)
%  hat=    S2*B2

function [K1 K2 K3]=ISMCgain(S, A, B, C, yc, P2);
%% Regular form transformation
[nn, mm] = size (B);

[Areg, Breg]=ss2im(A, B, C, yc)

%% Unit Vector Transform

[Au, Bu, Br, S1, S2]=uvti(Areg, Breg, S, yc);

[As, Bs]=parti(Au, Bu);


%% Gain calculations


for i=1:size(P2,1)
    phi(i)=-1/(2*P2(i,i));
end

PHI=diag([phi]);

hat=S2*Bs{2};

K1=pinv(hat)*(-S2*As{2,1});
K2=pinv(hat)*-(S2*As{2,2}*inv(S2)-PHI);
K3=-S1*Br;
end