%first row is the random integers between 0 and 1 for N times
%second row basically creates an array from 0 to N

clear all
a=rand(1,10);
a_count=0:9;
b=rand(1,20);
b_count=0:19;
c=rand(1,50);
c_count=0:49;
d=rand(1,100);
d_count=0:99;
e=rand(1,500);
e_count=0:499;


%for the distruption in part 3
% a(1)=a(1)+10^-8;
% b(1)=b(1)+10^-8;
% c(1)=c(1)+10^-8;
% d(1)=d(1)+10^-8;
% e(1)=e(1)+10^-8;





    
    

%using the t^n, to find this i used vande r function
%coefficent=Vander(# of elements)/elements'
x1=vander(a);
x2=vander(b);
x3=vander(c);
x4=vander(d);
x5=vander(e);

a_c=x1\a';
b_c=x2\b';
c_c=x3\c';
d_c=x4\d';
e_c=x5\e';

%plotting coefficents
subplot(3,2,1)
plot(a_count,a_c);
title('N=10');
subplot(3,2,2)
plot(b_count,b_c);
title('N=20');
subplot(3,2,3)
plot(c_count,c_c);
title('N=50');
subplot(3,2,4)
plot(d_count,d_c);
title('N=100');
subplot(3,2,5)
plot(e_count,e_c);
title('N=500');


%providing condition numbers and the graph
 c1=cond(x1);
 c2=cond(x2);
 c3=cond(x3);
 c4=cond(x4);
 c5=cond(x5);
 
 list=[c1 c2 c3 c4 c5];
 figure;
 plot(list);

 
 %for the distruption in part 3
a(1)=a(1)+10^-8;
b(1)=b(1)+10^-8;
c(1)=c(1)+10^-8;
d(1)=d(1)+10^-8;
e(1)=e(1)+10^-8;
%same steps as above
x1=vander(a);
x2=vander(b);
x3=vander(c);
x4=vander(d);
x5=vander(e);
a_c=x1\a';
b_c=x2\b';
c_c=x3\c';
d_c=x4\d';
e_c=x5\e';
figure;
subplot(3,2,1)
plot(a_count,a_c);
title('N=10');
subplot(3,2,2)
plot(b_count,b_c);
title('N=20');
subplot(3,2,3)
plot(c_count,c_c);
title('N=50');
subplot(3,2,4)
plot(d_count,d_c);
title('N=100');
subplot(3,2,5)
plot(e_count,e_c);
title('N=500');


