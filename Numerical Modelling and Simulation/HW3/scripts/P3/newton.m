% Newton iteration.
% The initial guess is the original (nominal) joint positions.
x = 0 * x; 
for i=1:size(Joints,1)
  x(2 * i - 1) = Joints(i,1);
  x(2 * i) = Joints(i,2);
end

xinit = x;

% The initial residual.
[Matrix, RHS] = loadNewton(Matrix,RHS,x);
initialRes = norm(RHS);
for iter = 1:maxNewtonIters
  [Matrix, RHS] = loadNewton(Matrix,RHS,x);
 % dx = (Matrix \ (-RHS' ))'
 
  dx= (pinv(Matrix)*(-RHS'))'       %Using a more stable inverse matrxi algorithm
    
  absdx(iter) = norm(dx);
  absb(iter) = norm(RHS);
 
  dxnorm = norm(dx)/norm(x);
  RHSnorm = norm(RHS)/initialRes;
  
  fprintf('Iteration #%d:  ||dx||=%.5e, ||RHS||=%.5e \n',iter,dxnorm,RHSnorm); 
  
  if (norm(dx) < (RelTol * norm(x))) & (norm(RHS) < (RelTol * initialRes))
    break;
  end
  x = x + dx;
  
end

