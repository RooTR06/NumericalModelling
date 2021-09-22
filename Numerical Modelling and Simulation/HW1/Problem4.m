
clear Matrix RHS R;
global I R Matrix RHS x;

%initializing the parameter
N=1000;  %divide no
dx=1/N;   %Delta x
res=0.1/dx; %resistor value
is=-50*dx;   %Isource value

Matrix(N+1,N+1) = 0;

RHS(N+1) = 0 ;

% Creating Matrix of nodes for resistors and Isources

node2 = [2:1:N+1];
node1 = [1:1:N];   
R=[node1;node2];
Resistors=R';

zero=[0];
z=repelem(0,N);
%f=[N+1];
%node0=[z f];
%a=[N];
%node3=[node1 z];

I=[node1;z];
Isources=I';

%Creating the G Matrix
for i = 1:size(Resistors,1)
 n1 = Resistors(i,1);
 n2 = Resistors(i,2);
 if n1 > 0 Matrix(n1, n1) = Matrix(n1,n1) + 1/res; end;
 if n2 > 0 Matrix(n2, n2) = Matrix(n2,n2) + 1/res; end;
 if ((n1>0) & (n2>0))
   Matrix(n1, n2) = Matrix(n1,n2) - 1/res; 
   Matrix(n2, n1) = Matrix(n2,n1) - 1/res; 
 end;
end

%Creating RHS matrix
for i = 1:size(Isources,1)
 n1 = Isources(i,1);
 n2 = Isources(i,2);
 if (n1 > 0) RHS(n1) = RHS(n1) - is; end;
 if (n2 > 0) RHS(n2) = RHS(n2) + is; end;
end

%Changing RHS matrix for Voltage sources & G Matrix for Voltage Sources
RHS(N+1)=300;
Matrix(1,1)=1;
Matrix(1,2)=0;

% Eliminate any last rows with purely zeros.
 realLength = length(RHS);
 quit = 1;
 while(quit > 0)
  if(norm(Matrix(realLength,:)) == 0)
   realLength = realLength - 1;
  else 
   quit = 0;
  end
 end
 

% Put a one on the diagonal of any purely zero row in Matrix.
for i = 1:length(RHS)
 if(norm(Matrix(i,:)) == 0) Matrix(i,i) = 1; end;
end

% b and G contain the reduced matrices without the extra zero rows. 
b = RHS(1:realLength)';
G = Matrix(1:realLength, 1:realLength);





