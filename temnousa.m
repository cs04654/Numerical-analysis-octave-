% PROGRAM 12
% Secant method.

function temnousa = temnousa(fs, x0, x1, acc, kmax)

% Inline function 
f = inline(fs);

k = 0;
stop = 0;
xp = x1;
xpp = x0;
fp = f(xp);
fpp = f(xpp);
fprintf('SECANT METHOD ON f(x)=%s FOR INITIAL POINTS x0=%f, x1=%f \n',fs,x0,x1);

% START ITERATIONS
while (stop == 0),
  % Get new point
  y = xp - fp*(xp-xpp)/(fp-fpp);
  % Check if solution is found
  aberr = abs(y-xp);
  if ((aberr <= acc) || (k+1 == kmax))
    stop = 1;
  end
  k = k+1;
  xpp = xp;
  fpp = fp;
  xp = y;
  fp = f(y);
  fprintf('ITERATION %d ::: Xnew=%15.12f WITH F(Xnew)=%e, AND |Xnew-Xprev| = %e \n',k,xp,fp,aberr);
end

% PRINT SOLUTION
fprintf('APPROXIMATED FIXED POINT IS\nX=%15.12f WITH F(X)=%15.12f FOUND AFTER k=%d/%d ITERATIONS \n', xp, fp, k, kmax);
