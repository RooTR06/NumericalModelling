
F=f.';  %transpose of RHS
ep=10^-6;
iter=0;

list=[];
lister=[];

while (1)
    iter=iter+1;
%   dx=-fj\F;  
    dx= (pinv(fj)*-F)'  ;
    x=x+dx;
    list=[list norm(x)];
    lister=[lister;x];
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
    
%     if dx<ep
%         break;
%     end;
    if (iter > itermax)                         %conditon for the maxiteration
        break;
    end;
end
plot(list);
