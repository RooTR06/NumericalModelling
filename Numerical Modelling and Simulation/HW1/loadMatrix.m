% Zero the matrix and the rhs.
Matrix = 0 * Matrix;
RHS = 0 * RHS;

% Zero the matrix and the rhs.
Matrix = 0 * Matrix;
RHS = 0 * RHS;

% Load the resistors.
for i = 1:size(Resistors,1)
 n1 = Resistors(i,2);
 n2 = Resistors(i,3);
 res = Resistors(i,1);
 if n1 > 0 Matrix(n1, n1) = Matrix(n1,n1) + 1/res; end;
 if n2 > 0 Matrix(n2, n2) = Matrix(n2,n2) + 1/res; end;
 if ((n1>0) & (n2>0))
   Matrix(n1, n2) = Matrix(n1,n2) - 1/res; 
   Matrix(n2, n1) = Matrix(n2,n1) - 1/res; 
 end;
end

% Load the VCCSs
for i = 1:size(Csources,1)
 n1 = Csources(i,2);
 n2 = Csources(i,3);
 n3 = Csources(i,4);
 n4 = Csources(i,5);
 gm = Csources(i,1);
 if ((n1>0) & (n3 > 0))
   Matrix(n1, n3) = Matrix(n1,n3) + gm;
 end; 
 if ((n1>0) & (n4 > 0) )
    Matrix(n1, n4) = Matrix(n1,n4) - gm;
 end; 
 if ((n2>0) & (n3 > 0))
  Matrix(n2, n3) = Matrix(n2,n3) - gm;
 end; 
 if ((n2>0) & (n4 > 0))
  Matrix(n2, n4) = Matrix(n2,n4) + gm;
 end; 
end


%CHANGE-MATRIX; attend 1 to the corresponding node of the Vsource
for i = 1:size(Vsources,1)
 n1 = Vsources(i,2);
 n2 = Vsources(i,3);
 if n1 > 0 Matrix(n1,:) =  1;  end;
 if n2 > 0 Matrix(n2,:) =  1;  end;
end
% Load the current sources.
for i = 1:size(Isources,1)
 n1 = Isources(i,2);
 n2 = Isources(i,3);
 is = Isources(i,1);
 if (n1 > 0) RHS(n1) = RHS(n1) - is; end;
 if (n2 > 0) RHS(n2) = RHS(n2) + is; end;
end

%CHANGE-RHS;attend Vsource value to corresponding line
for i = 1:size(Vsources,1)
 n1 = Vsources(i,2);
 n2 = Vsources(i,3);
 vol= Vsources(i,1);
 if n1 > 0 RHS(n1) =  vol;  end;
 if n2 > 0 RHS(n2) = -vol;  end;
end

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
