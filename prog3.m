% PROGRAM 3
% Iterative improvement of approximate solution of linear system.

function prog3 = prog3(A,b,xini,kmax,acc)

x = xini;
invA = inv(A);
k = 0;
distprev = 1;

printf('System matrices A and b\n');
A
b'
printf('True solution\n');
xtrue = invA*b;
xtrue'
printf('Initial approximate solution\n');
xini'

while ((k<kmax) && (distprev > acc)),
  k = k+1;
  printf('[1] *** Iteration k=%d ***\n',k);
  r = A*x-b;
  printf('[2] Residual r(%d): ',k); 
  display(r');
  vep = invA*r;
  printf('[3] Epsilon eps(%d): ',k); 
  display(vep');
  y = x;
  x = x - vep;
  printf('[4] New approximation x(%d): ',k); 
  display(x');
  distopt = norm(x-xtrue,1);
  distprev = norm(x-y,1);
  printf('Distance from true solution: ||xtrue - x(%d)|| = %e \n',k,distopt);
  printf('Distance from previous approximation: ||x(%d) - x(%d)|| = %e \n\n',k,k-1,distprev);
 end
