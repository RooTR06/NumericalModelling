clear all
plt=[];
for okok=60:60;

siz=okok;      %enter size here
c=siz+1;    

i=[];
ii=[];
jj=[];
j=[];

for twod_gen=0:siz                  %two D matrix generation
    inc2d=twod_gen*c;
    for m=1:siz
        inc=m;
     a(m)=inc+inc2d;                %1st array of 1D resistors
     a2(m)=inc+twod_gen*siz;        %2nd array of 1D resistors: crossing the last resistor set
     b(m)=inc+inc2d+1;              %nodal pair of 1st set 
     b2(m)=inc+c+twod_gen*siz;      %nodal pair of 2nd set
    end
    i=[i,a];                         %appendþng the temporary array to permanent arrays
    j=[j,b];
    ii=[ii,a2];
    jj=[jj,b2];
end

i=[i,ii];
j=[j,jj];
S=sparse(i,j,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
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
H=L+U;
N=nnz(H)

plt=[plt,N];
end

plot(plt);
title('2D resistor grid LU factored nodal nnz')  



