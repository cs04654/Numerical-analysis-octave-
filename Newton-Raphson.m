% PROGRAM 11
% Newton-Raphson method.

function Newton-Raphson = Newton-Raphson(fs, gs, x0, acc, kmax)

% Inline function and derivative
f = inline(fs);
g = inline(gs);

k = 0;
stop = 0;
x = x0;
fx = f(x);
gx = g(x);
fprintf('NEWTON-RAPHSON METHOD ON f(x)=%s WITH DERIVATIVE g(x)=%s FOR INITIAL POINT x0=%f \n',fs,gs,x0);

% START ITERATIONS
while (stop == 0),
  % Get new point
  y = x - fx/gx;
  % Check if solution is found
  aberr = abs(y-x);
  if ((aberr <= acc) || (k+1 == kmax))
    stop = 1;
  end
  k = k+1;
  x = y;
  fx = f(x);
  gx = g(x);
  fprintf('ITERATION %d ::: Xnew=%15.12f WITH F(Xnew)=%e, G(Xnew)=%e AND |Xnew-Xprev| = %e \n',k,x,fx,gx,aberr);
end

% PRINT SOLUTION
fprintf('APPROXIMATED FIXED POINT IS\nX=%15.12f WITH F(X)=%15.12f, G(X)=%15.12f FOUND AFTER k=%d/%d ITERATIONS \n', x, fx, gx, k, kmax);
