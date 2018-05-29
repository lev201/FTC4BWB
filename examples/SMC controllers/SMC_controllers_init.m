%% preamble
% clear all
% clc
% 
% load('BWBss');
% ss=BWBlat1;


A=BWBlat.A;
B=BWBlat.B;

%% Model parameters

[B2 Bv]=fact(B);
x0=[0 0 0 0 0]';

%% Controller Parameters
Q=diag([1 1 1 1 1]);
P2=eye(3);
rho=10;


%% Lateral Sliding Mode Design
Q=diag([1 1 1 1 1]);

Q11=Q(1:2, 1:2);
Q12=Q(1:2, 3:5);
Q21=Q(3:5, 1:2);
Q22=Q(3:5, 3:5);

A11=BWBlat.A(1:2, 1:2);
A12=BWBlat.A(1:2, 3:5);
A21=BWBlat.A(3:5, 1:2);
A22=BWBlat.A(3:5, 3:5);

A_hat=A11-A12*inv(Q22)*Q21;

Q_hat=Q11-Q12*inv(Q22)*Q21;

P1=care(A_hat, A12, Q_hat);

M=inv(Q22)*(A12'*P1+Q21);
E=eig(A11-A12*M);
S2=diag([1 1 1]);
S1=[S2*M];
S=[S1 S2]

A11=A11-A12*M;
A12=A12*inv(S2);
A21=M*A11+A21-A22*M;
A22=M*A12+A22;

p1=1;
p2=1;
p3=1;

P2=diag([p1 p2 p3]);

phi1=-1/(2*p1);
phi2=-1/(2*p2);
phi3=-1/(2*p3);

phi=diag([phi1, phi2, phi3]);
% 
% Q=diag([1 1 1 1 1]);
% 
% Q11=Q(1:2, 1:2);
% Q12=Q(1:2, 3:5);
% Q21=Q(3:5, 1:2);
% Q22=Q(3:5, 3:5);
% 
% A11=BWBlatv.A(1:2, 1:2);
% A12=BWBlatv.A(1:2, 3:5);
% A21=BWBlatv.A(3:5, 1:2);
% A22=BWBlatv.A(3:5, 3:5);
% 
% A_hat=A11-A12*inv(Q22)*Q21;
% 
% Q_hat=Q11-Q12*inv(Q22)*Q21;
% 
% P1=care(A_hat, A12, Q_hat);
% 
% M=inv(Q22)*(A12'*P1+Q21);
% E=eig(A11-A12*M);
% S2=diag([1 1 0.1])*pinv(Bv2);
% S1=[S2*M];
% Slat=[S1 S2]
% 
% A11=A11-A12*M;
% A12=A12*inv(S2);
% A21=M*A11+A21-A22*M;
% A22=M*A12+A22;

%% SQM
% S=SQM(A, Bv, Q);
% [K1 K2]=SMCgain(S, A, Bv, P2);
% K1=-K1
% K2=-K2
% hat=eye(3);
% p=3;
% clear Atemp
% clear Btemp
Br=[eye(2)];
%%
K1=-S2*A21;
K2=-(S2*A22*inv(S2)-phi);
K3=-S1*Br

