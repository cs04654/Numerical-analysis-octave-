% PROGRAM 14
% Lagrange interpolation method.

function lagrange_newton_gregory = lagrange_newton_gregory(x, fx, y)

% x : row array of interpolation points
% fx: row array of interpolation point values
% y : point of interest
% fy: Lagrange interpolation approximation

n = length(x);  % number of interpolation points

% Compute Lagrange functions
for i=1:n,
  nom = 1;  % nominator
  den = 1;  % denominator
  for j=1:n,
    if (j ~= i)
      nom = nom*(y-x(j));
      den = den*(x(i)-x(j));
    end
  end
  L(i) = nom / den;
end

% Compute Lagrange polynomial
fy = fx * L';

% PRINT SOLUTION
fprintf('LAGRANGE INTERPOLATION ON Y=%f GIVES VALUE P_%d(Y)=%15.12f \n', y, n-1, fy);
