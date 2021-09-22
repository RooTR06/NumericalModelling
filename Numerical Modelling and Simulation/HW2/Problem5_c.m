[n,n] = size(G);
x = ones(n,1)/n;
while 1
    y=x;
    x=A*x;
    if y==x
        break
    end
end
   