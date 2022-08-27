% PROGRAM 13
% Regula falsi method.

function Regula_falsi = Regula_falsi(fs, x0, x1, acc, kmax)

% Inline function 
f = inline(fs);

k = 0;
stop = 0;
f1 = f(x1);
f0 = f(x0);
a = x0;
b = x1;
fa = f0;
fb = f1;
xp = x1;
fprintf('REGULA FALSI METHOD ON f(x)=%s FOR INITIAL POINTS x0=%f, x1=%f \n',fs,a,b);

% START ITERATIONS
while (stop == 0),
  % Get new point
  y = b - fb*(b-a)/(fb-fa);
  fy = f(y);
  % Check if solution is found
  aberr = abs(y-xp);
  if ((aberr <= acc) || (k+1 == kmax))
    stop = 1;
  end
  k = k+1;
  if (fy*fb < 0)
    a = y;
    fa = fy;
  else
    b = y;
    fb = fy;
  end
  xp=y;
  fprintf('ITERATION %d ::: Xnew=%15.12f WITH F(Xnew)=%e AND |Xnew-Xprev| = %e \n',k,y,fy,aberr);
end

% PRINT SOLUTION
fprintf('APPROXIMATED FIXED POINT IS\nX=%15.12f WITH F(X)=%15.12f FOUND AFTER k=%d/%d ITERATIONS \n', y, fy, k, kmax);
