c=1;N=100;
total=0;f=0;
lambda=0;x=0;lambdaprev=0; xprev=0;
dirak=0.9;
while lambda<1
  
    x=0;
    
    for i=1:N                               %try to solve fx
        f=Fx(N,c,x,i);
        df=lambda*f+(1-lambda)*xprev;
        x=xprev+f/df;
        if abs(x)<1                      %if converged
            lambdaprev=lambda; 
            lambda=lambda+dirak;
            dirak=2*dirak;
        else
            dirak=dirak/2;
            lambda=lambdaprev+dirak;
        end
        
    end
    
end


