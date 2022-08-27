% PROGRAM 10
% Fixed point iteration method.

function genikh_epanalipthkh_methodos = genikh_epanalipthkh_methodos(fs, x0, acc, kmax)

% Inline function
%fs = "cos(x)";
f = inline(fs);

k = 0;
stop = 0;
x = x0;
fprintf('FIXED POINT ITERATION ON f(x)=%s FOR INITIAL POINT x0=%f \n',fs,x0);

% START ITERATIONS
while (stop == 0),
  % Get new point
  y = f(x);
  % Check if solution is found
  aberr = abs(y-x);
  if ((aberr <= acc) || (k+1 == kmax))
    stop = 1;
  end
  k = k+1;
  x = y;
  fprintf('ITERATION %d ::: Xnew=%15.12f WITH |Xnew-Xprev| = %e \n',k,y,aberr);
end

% PRINT SOLUTION
fprintf('APPROXIMATED FIXED POINT IS\nX=%15.12f WITH F(X)=%15.12f FOUND AFTER k=%d/%d ITERATIONS \n', x, f(x), k, kmax);
