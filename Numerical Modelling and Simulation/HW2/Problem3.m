clear all
%creating a suitable matrix,diagonal entries deleted to prevent matlab
%making chains to node's-self
P=[ 0 -1 0 0 0 0 0 0;
    -1 0 -1 0 0 0 0 0;
    0 -1 0 -1 0 0 0 0;
    0 0 -1 0 -1 0 0 0;
    0 0 0 -1 0 -1 0 0;
    0 0 0 0 -1 0 -1 0;
    0 0 0 0 0 -1 0 -1 ;
    0 0 0 0 0 0 -1 0 ];
P=abs(P);   %taking the absolute value for dtmc
mc=dtmc(P); %creating Markov chain

figure;
graphplot(mc);  %Plotting Markoc Chain