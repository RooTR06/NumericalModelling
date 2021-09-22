
[i1,j1,s1] = find(S);
iter=length(i);
global Matrix;
Matrix = sparse(iter,iter);

for g=iter
 n1=i(g); n2=j(g);
 if n1 > 0 Matrix(n1, n1) = Matrix(n1,n1) + 1; end;
 if n2 > 0 Matrix(n2, n2) = Matrix(n2,n2) + 1; end;
 if ((n1>0) & (n2>0))
   Matrix(n1, n2) = Matrix(n1,n2) - 1; 
   Matrix(n2, n1) = Matrix(n2,n1) - 1; 
 end;
end


A=full(Matrix);


[L,U]=lu(A);



    