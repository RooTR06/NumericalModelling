%exact solution
clear
b=[0 3 -2];
t0=0; tf=1;             %initial and final times
h=0.05;                  %step size
y0 = 1;
t = t0; y = y0; % initialize t and y
N = ceil((tf-t0)/h);
w=[];


for i=1:N                   %computing the solution with part a
    fn = mydiff(t,y) ;
    y1=y+0*h*fn;
    fn_1 = mydiff(t+h,y1);
    y2=y1+h*(0*fn+1*fn_1);
    fn_2 = h*mydiff(t+2*h,y2);
    z=y2+h*(0*fn+3*fn_1-2*fn_2);
    t=t+h;
    y=z;
    exact=cos(i*h);
    error=exact-y;
    w = [w; t exact z' error ];     %adding paremeters to here
end

subplot(2,1,1);
hold on
loglog(w(:,1),w(:,4));
title('4.a)log-log Plot For the Error h=0.05');
xlabel('Time');
ylabel('error');
axis tight,  hold off
hold on

clear fn y1 y2 exact error w t i y

w=[];t = t0; y = y0;             %initilizae the values again
for i=1:N                   %computing the solution with part a
    fn = mydiff(t,y) ;
    y1=(-1*y-0.6*h*fn)/(-1);
    y2=(-(1*y) - (-2.0847*y1)+ (0.4421*h*fn))/1.0847;
    t=t+h;
    y=y2;
    exact=cos(i*h);
    error=exact-y;
    w = [w; t exact y2' error ];     %adding paremeters to here
end



hold on
subplot(2,1,2);
hold on
loglog(w(:,1),w(:,4));
title('4.c)log-log Plot For the Error, h=0.05');
xlabel('Time');
ylabel('error');
axis tight,  hold off

% legend('part a','part c');
% legend('Location','northwest')