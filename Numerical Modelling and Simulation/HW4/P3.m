clear all

%initialize parameters
h =0.8;            %choose the h
g=6;                %choose iteration number for different h
dec=0.1;           %choose the iteration difference for h
a=num2str(h);
mu = 1;        
Xmax = 20;
nmax = round(Xmax/h);



for j=1:g 
y = [2 0];
yvec = [y; zeros(nmax,2)];
xvec = zeros(nmax+1,1);

for i = 1:nmax
    yprime = mu*(1-(y(1).^2))*y(2)-y(1);
    y = y + h*yprime;
    yvec(i+1,:) = y;
    xvec(i+1) = i*h;
end

subplot(g, 3, 1+(j-1)*3);
plot(xvec,yvec(:,1),'linewidth',1), grid
xlabel('time'), ylabel('x(t)')

title(sprintf('Forward Euler For h = %f', h));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y = [2 0];
yvec = [y; zeros(nmax,2)];
xvec = zeros(nmax+1,1);

for i=1:nmax
    yprime2 = mu*(1-(y(1).^2))*y(2)-y(1);
    yeval = y + h*yprime2;
    yprime= mu*(1-(yeval(1).^2))*yeval(2)-yeval(1);
    y=y+h*yprime;
    yvec(i+1,:) = y;
    xvec(i+1) = i*h;
end

subplot(g, 3, 2+(j-1)*3);
plot(xvec,yvec(:,1),'linewidth',1), grid
xlabel('time'), ylabel('x(t)');
title(sprintf('Backward Euler For h = %f', h));
%%%%%%%%%%%%%%%%%%%Trapezoidial%%%%%%%%%%%%%%%%%%%%%%%%

%initiliaze x(t) and time vectors
y = [2 0];                  
yvec = [y; zeros(nmax,2)]; 
xvec = zeros(nmax+1,1);

%for loop for iteration of trapezoidal scheme
for i=1:nmax
    yprime2 = mu*(1-(y(1).^2))*y(2)-y(1);
    yeval = y + h*yprime2;
    yprime= mu*(1-(yeval(1).^2))*yeval(2)-yeval(1);
    y=y+(h/2)*(yprime2+yprime);
    yvec(i+1,:) = y;
    xvec(i+1) = i*h;
end

subplot(g, 3, 3+(j-1)*3);
plot(xvec,yvec(:,1),'linewidth',1), grid
xlabel('time'), ylabel('x(t)')
title(sprintf('Trapezoidal scheme For h = %f', h));

h=h-dec;
end




