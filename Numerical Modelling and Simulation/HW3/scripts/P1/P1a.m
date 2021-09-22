
% below  only to see the convergence
% ezplot('x+(10^-6)*exp(80*x)-5',[0 0.2])  %to check convergence

%initilize the below parameters before starting from the command prompt
%only once
% numiter=[];
% numep=[];
% x=0;

%for iterartion;
%write i=1;P1b; and do this 10 times while incrementing the value of i

%for the first part only write i=10;P1b;

ep=1;n=0;

    while ep>=10^-6
        f=x+(10^-6)*exp(80*x)-0.5*i;
        df=1+[80*(10^-6)*exp(80*x)];
        xn=x-f/df;
        ep=abs(x-xn);
        x=xn;
        n=n+1;
    end
    
numiter(i)=n;
numep(i)=ep;
