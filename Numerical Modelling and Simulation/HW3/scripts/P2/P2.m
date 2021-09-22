clear
V=100;N = 20; Res = 1.0e-6;itermax = 200;e = ones(N,1); %define parameters
global M;
M = spdiags([-e 2*e -e], -1:1, N, N);           %create Matrix G
fi = zeros(N,1);
nres = 0;
nsolves = 0;
F = RHS(fi,N,V);                                %function F
initialF = norm(F);                             %norm of F
fprintf(1, 'Initial F = %g\n', initialF);
nres = nres + 1;                                %since we calculated the first function above
iter = 0;

while(1)
    iter = iter + 1;                            %number of iterations
    nFold = norm(F);                            %for damping
    h = 1 / (N+1);                              %calculate dx
    J = M + h*h*2.0*spdiags([cosh(fi)], 0, N, N);
    dx = -J \ F;
    nsolves = nsolves + 1;                      %number of linear solutions
    alpha = 1.0;                                %for the first condition alpha=1
    F = RHS(fi + alpha * dx, N, V);             % calculate F for every iteration again
    nres = nres + 1;                            %increase residual eval
    
    while(norm(F) >= nFold)                     %damping  part
        alpha = 0.5 * alpha;
        F = RHS(fi + alpha * dx, N, V);         %F calculation wtih alpha
        nres = nres + 1;                        %increase residual eval
    end
    
    fi = fi + alpha * dx;                       %establish new fi associated with dx
    fprintf(1, 'Iteration #%d: ||dx|| = %g, ||F|| = %g, a= %g\n',iter, norm(dx), norm(F), alpha);
    if (norm(dx) < Res * norm(fi) & norm(F) < Res * initialF) %condition check
        break;
    end;
    if (iter > itermax)                         %conditon for the maxiteration
        break;
    end;
end;
fprintf(1, 'For V = %g:  # Iterations: %d, Residual evaluations: %d, # Lin sys solves: %d \n', V, iter, nres, nsolves);