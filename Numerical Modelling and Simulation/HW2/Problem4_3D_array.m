clear all
plt=[];
for m=15:15;

siz=m;
c=siz+1;
k=c^2;

i=[];
ii=[];
iii=[];
jjj=[];
jj=[];
j=[];

%3D matrix generation algorithm, this part is just like the 2D part.
%This part creates paralel 2D surfaces without connections to each other
for threed_gen=0:siz                
    inc3d=threed_gen;               
    for twod_gen=0:siz
        inc2d=twod_gen*c;
        for m=1:siz
            inc=m;
         a(m)=inc+inc2d+inc3d*c^2;              %just like 2D, execpt incrementals for 3D
         a2(m)=inc+twod_gen*siz+inc3d*c^2;      %those incrementals help to create paralel 2D's
         b(m)=inc+inc2d+1+inc3d*c^2;
         b2(m)=inc+c+twod_gen*siz+inc3d*c^2;
        end
        
        i=[i,a];
        j=[j,b];
        ii=[ii,a2];
        jj=[jj,b2];
    end
end
%this is the part that vertical resistors that cross the 2D surfaces are created
for threeD_gen=0:siz-1
    inc3d=threeD_gen;
    a3=(1:1:k);
    a3=a3+inc3d*k;
    b3=a3+k*(threeD_gen+1);  
    iii=[iii,a3];
    jjj=[jjj,b3];
end

 i=[i,ii];
 i=[i,iii];
 j=[j,jj];
 j=[j,jjj];
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

%plot(plt);
%title('3D resistor grid LU factored nodal nnz')  




