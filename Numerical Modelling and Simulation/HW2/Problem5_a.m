[n,n] = size(G);
p = (1:n)';

for k = 1:n-1
% Find diagonal j>i max Markovitz product
[r,m] = max(abs(G(k:n,k)));
m = m+k-1;
if (G(m,k) ~= 0)  % Skip elimination if column is zero
% Swap rows j with i and columns j with i
if (m ~= k)
G([k m],:) = G([m k],:);
p([k m]) = p([m k]);
end
%multipliers
i = k+1:n;
G(i,k) = G(i,k)/G(k,k);
% new row of i and determine fill-ins
j = k+1:n;
G(i,j) = G(i,j) - G(i,k)*G(k,j);
end
end

L = tril(G,-1) + eye(n,n);
U = triu(G);
H=L+U