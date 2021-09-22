[n,n] = size(G);
p=0.85;
d=(1-p)/n;
c = sum(G,1);                           %create cj matrix
A=zeros(N,N);                           %nitiliaze A matrix with zeros

for j=1:n                               %fill-in a matrix
    for i=1:n
        if c(j)~= 0
            A(i,j)=p*G(i,j)/c(j)+d;
         elseif  c(j)==0
             A(i,j)=1/n; 
        end;
    end
end
spy(A);
