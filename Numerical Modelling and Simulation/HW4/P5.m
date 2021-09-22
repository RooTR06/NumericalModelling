
clear

N = 100;
th = linspace(0,2*pi,N);
r = exp(i*th);

%below are the boundry locus functions
% fb = @(r) (r.^4-r.^3)./((-0.904040490087420) + (4.58835128117635*r) + (-1.24865552362207*r.^2) + (1.27287284517877*r.^3) + (0.291471887354060*r.^4));
fa=@(r) (r.^4-r.^3)./((-91.5922044358731) + (112.894695788715*r) + (-21.9171145965376*r.^3) + (4.61462324369555*r.^4));            
% fc=@(r)  ((r.^4) + (- 3.66402080425155*r.^3) + (10.1552923338181*r.^2) + (-23.6954871919049*r) +16.2042156623407 )./(0.336251099998667*r.^4);


%implemet these if you want to check what happens when delta_t goes to o
% fa=@(r) (r.^4-r.^3);
% fb = @(r) (r.^4-r.^3);
% fc=@(r)  ((r.^4) + (- 3.66402080425155*r.^3) + (10.1552923338181*r.^2) + (-23.6954871919049*r) +16.2042156623407 );
% fc=@(r)  ((r^4) + (- 3.66402080425155*r.^3) + (10.1552923338181*r.^2) + (-23.6954871919049*r) +16.2042156623407 );

%for the 4c roots can be calulated as in here,
% pol=[1 -3.66402080425155 10.1552923338181 -23.6954871919049 16.2042156623407];
% roots(pol);

%plot the graph
x = fa(r);
plot(x,'k-'); hold on;
clr = [221 221 221]/255;
fill(real(x),imag(x),clr)
plot([min(real(x)) max(real(x))],[0 0],'r--')
plot([0 0],[min(imag(x)) max(imag(x))],'r--')
title('Absolute Stabilty Region');
xlabel('Re');
ylabel('Im');
