%% preamble
clear all
clc
addpath(genpath('C:\Users\Liam Uni\OneDrive - University of Exeter\FTC4BWB'));
load('BWBss');

%% Model parameters
ss=BWBlat1;
[A, B, C, D]=ss2m(ss);

%% Controller Parameters
Q=eye(5);
P2=-eye(5);

S=SQM(A, B, Q);




