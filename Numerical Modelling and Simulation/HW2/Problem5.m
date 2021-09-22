clear all
N=10000;
G=zeros(N,N);
j1=[];
j=[];

% for count=1:10000
%     p=randperm(10000,10);
%     j=[j, p]; 
%     a=p(end-9:end);
%       if ismember(count,a)==1
%           p(end-9:end)=[]; 
%           count=count-2;
%       end  
% end

for count=1:N
    j=randi(10,1,1);            %create random number
    j1=randperm(N,j);           %create links with the random number
     for k=1:length(j1)     
         G(count,j1(k))=1;      %append links to G matrix
     end

end
spy(G);

%to check sparcity
out=nnz(~G);    %number of nonzeros
a=N^2;          %number of elements
b=out/a         %checking for the sparsity, b>0.5 it is a sparse matrix indeed





