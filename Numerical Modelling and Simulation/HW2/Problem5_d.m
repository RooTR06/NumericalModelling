[n,n] = size(G);
p=0.85;
d=(1-p)/n;
D=sparse(n,n)
Z=[]

c = sum(G,1);                   %creating cj vector
D = sparse(k,k,1./c(k),n,n);    %creating djj matrix
e = ones(n,1);                  %creating e matrix
for h=1:n                       %creating z matrix
    if c(h)~=0
        Z =[Z,d];
    elseif c(h)==0
        Z=[Z,1/n];
    end;   
end

A=p*G*D+e.*Z';                  %calculate transition matrix
    


