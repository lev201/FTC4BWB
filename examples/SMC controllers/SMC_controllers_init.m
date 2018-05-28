%% preamble
clear all
clc

load('BWBss');
ss=BWBlat1;



%% Model parameters
[A, B, C, D]=ss2m(ss);
[A, B, Tr]=stdfrm(A,B);
[B2 Bv]=fact(B);
x0=[0 0 0 0 0]';

BWBlatsf=ss2ss(BWBlat1, Tr)

%% Controller Parameters
Q=diag([1 1 1 1 1]);
P2=eye(3);
rho=20;
delta=0.01;

%% SQM
S=SQM(A, B, Q);
[K1 K2]=SMCgain(S, A, B, P2)
%%


