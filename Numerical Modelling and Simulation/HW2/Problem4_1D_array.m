clear all
plt=[];
for okok=5000:5000;

siz=okok; %enter size here
c=siz+1;

for m=1:c   %1D matrix generation
i=[1:1:m-1];
j=[2:1:m];
end
S=sparse(i,j,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
[i1,j1,s1] = find(S);
iter=length(i);

global Matrix;
Matrix = sparse(iter+1,iter+1);

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
H=L+U;
N=nnz(H)

plt=[plt,N];
end

%plot(plt);
%title('1D resistor grid LU factored nodal nnz') 

