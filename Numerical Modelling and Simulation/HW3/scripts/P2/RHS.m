function F = RHS(fi,N,V)        %create RHS
global M;
h = 1 / (N+1);
F = M * fi + h*h*2.0*sinh(fi);
F(1) = F(1) + V;
F(N) = F(N) - V;