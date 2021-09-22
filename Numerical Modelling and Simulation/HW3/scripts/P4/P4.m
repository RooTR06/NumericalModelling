
% below  only to see the convergence
% ezplot('x+(10^-6)*exp(80*x)-5',[0 0.2])  %to check convergence
clear
clc

 
n=50;
itermax=200;
valstart=0.1;
nplus1=n+1;
a = rand(n,n);              %generate random matrix
a = a*a';   
x=zeros(1,nplus1);

f=zeros(1,nplus1);
fj=zeros(nplus1,nplus1);



%fill x matrix with initial values of x
for i=1:nplus1
        x(i)=valstart;
end

% create jacobi
for i=1:nplus1
    for j=1:nplus1
        if(i==nplus1 &j==nplus1)
            fj(nplus1,nplus1)=0;
        elseif(i==j)
            fj(i,i)=a(i,i)-x(nplus1);
            
        elseif(j==nplus1)
            fj(i,nplus1)=-x(i);
            
        elseif(i==nplus1)
            fj(nplus1,j)=2*x(j);
        else
            fj(i,j)=a(i,j);
        end
    end
end
%create vector f
for i=1:nplus1 
    if i-nplus1<0
        f(i)=-x(nplus1)*x(i);
        for j=1:n
            f(i)=f(i)+a(i,j)*x(j);
        end
    else
        f(i)=-1;
        
        for j=1:n
            f(i)=f(i)+x(i)^2;
        end
    end
end

% for i=1:nplus1
%         x(i)=norm(fj);
% end









