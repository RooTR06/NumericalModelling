clear all
k=4;
pmax=2*k;
row=[];
B=[];A=[];


for p=0:pmax
    for j=0:k                   %calculating the coeffiecent a here
        a=(k-j)^p;
        A(p+1,j+1)=a;
    end
    for j=0:k                   %calculating the coeffiecent b here
        if p==0 && j==k
            b=0;
        else
            b=p*((k-j)^(p-1));
        end
        B(p+1,j+1)=-b;
    end
    
end

Aa=A;
Ab=A;
Ac=A;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PART A%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:k+1                     %make the changes for initial values of a0,...,ak
    if j==1
        Aa(:,j:j)=Aa(:,j:j)*1;
    elseif j==2
        Aa(:,j:j)=Aa(:,j:j)*-1;
    else
        Aa(:,j:j)=Aa(:,j:j)*1;
    end
end
RHS1=zeros(length(Aa),1);
Aa=-Aa;
for j=1:k+1                     %calculate the RHS with the initiliazed values
    RHS1=RHS1+Aa(:,j:j);
end

Ca=B\RHS1;                      %calculate the remaining coefficeints



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PART B%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:k+1                     %make the changes for initial values of a0,...,ak
    if j==1
        Ab(:,j:j)=Ab(:,j:j)*1;
    elseif j==2
        Ab(:,j:j)=Ab(:,j:j)*-1;
    else
        Ab(:,j:j)=Ab(:,j:j)*1;
    end
end
RHS2=zeros(length(Ab),1);
Ab=-Ab;
for j=1:k+1                     %calculate the RHS with the initiliazed values
    RHS2=RHS2+Ab(:,j:j);
end

Cb=B(:,2:k+1)\RHS2;                      %calculate the remaining coefficeints



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PART C%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:k+1                     %make the changes for initial values of a0,...,ak
    if j==1
        Ac(:,j:j)=Ac(:,j:j)*1;
    end
end


RHS3=zeros(length(Ac),1);
M=Ac(:,2:k+1);                           %coeffienct matrix
RHS3=RHS3-Ac(:,1:1);                    %calculate the RHS with the initiliazed values
Cc=M\RHS3                              %calculate the remaining coefficeints



