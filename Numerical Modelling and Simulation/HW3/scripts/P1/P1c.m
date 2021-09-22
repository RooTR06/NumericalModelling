clear
% ezplot('80*x-log((10^-6)*(5-x))',[0 0.2])  %to check convergence

ep=1;n=0;x=0;
a=[];

    f=(80*x-(log((10^6)*(5-x))));
    df=(80-(-10^6/((10^6)*(5-x))));
    xn=x-f/df;
    ep=abs(x-xn);
    x=xn;
    n=n+1;
    a(n)=[x];


    