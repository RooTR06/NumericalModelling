
%This code is written to compare the differences 
%between 6,7&8 sized conductance matrices.

G6=[ 2 -1 0 0 0 0;
    -1 2 -1 0 0 0;
    0 -1 2 -1 0 0;
    0 0 -1 2 -1 0;
    0 0 0 -1 2 -1;
    0 0 0 0 -1 2 ;];
  
G7=[ 2 -1 0 0 0 0 0;
    -1 2 -1 0 0 0 0;
    0 -1 2 -1 0 0 0;
    0 0 -1 2 -1 0 0;
    0 0 0 -1 2 -1 0;
    0 0 0 0 -1 2 -1; 
    0 0 0 0 0 -1 2 ];

G8=[ 2 -1 0 0 0 0 0 0;
    -1 2 -1 0 0 0 0 0;
    0 -1 2 -1 0 0 0 0;
    0 0 -1 2 -1 0 0 0;
    0 0 0 -1 2 -1 0 0;
    0 0 0 0 -1 2 -1 0;
    0 0 0 0 0 -1 2 -1 ;
    0 0 0 0 0 0 -1 2 ];

inv(G6)
inv(G7)
inv(G8)

det(G6)
det(G7)
det(G8)

a=min(min(inv(G6)))
b=min(min(inv(G7)))
c=min(min(inv(G8)))

