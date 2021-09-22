clear
a=0;
b=10;
h=0.1;
n=(b-a)/h;
x=zeros(1,n);
cmp=zeros(1,n);



for i=1:n
    x(i)=h/2+(i-1)*h;      %compute exact solution, x(i) is the ith mid-point
end
S=1;
for i=1:n
    exact(i)=exp(x(i)+h/2);          %computes the exact value
    
    S=S+h*(exp(x(i)));               %computes the sum in the midpoint rule
    cmp(i)=S;
    
end
plot(x+1,cmp);
hold on;
plot (x+1,exact);
title('t=[0,10] with h=0.1')
xlabel('time')
ylabel('solution')
legend(["computed solution";"exact solution"]);





% Repating with h = 2,0.5,0.1 gives
% h=2=> 1.874286812771613e+04, 
% h=0.5=>2.179869584585683e+04
% h=0.1=> 2.201729119339274e+04
% exact value=>2.202646579480672e+04, 
%from this solution it can be seen that with the increasing number of
%iteration points aproximation becomes closer to exact solution.
%comparsion plots between computed and exact value has been provided in
%report

