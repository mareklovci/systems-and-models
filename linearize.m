function [ A, B, C, D ] = linearize( m, M, k, b )
%LINEARIZE Summary of this function goes here
%   Detailed explanation goes here

km = k/m;
bm = b/m;
kM = k/M;
bM = b/M;

A = [0 1 0 0; -kM -bM kM bM; 0 0 0 1; km bm -km -bm];

B = [0; 1/M; 0; 0];

C = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

D = [0; 0; 0; 1];

end

