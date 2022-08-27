% PROGRAM 8
% Gauss-Seidel method for solving linear systems.

function Gauss-Seidel = Gauss-Seidel(A,b,x0,eta)

[n,n] = size(A);
x = x0';
y = x;

% CHECK INPUT MATRIX
detA = det(A);
if (detA == 0)
  error('INPUT MATRIX A IS NOT INVERTIBLE (det(A) = %f) \n', detA);
end
normb = norm(b,1);
if (normb <= 1.e-16)
  error('INPUT VECTOR b IS ALMOST ZERO (||b||_1 = %f) \n', normb);
end

% MATRIX DECOMPOSITION
D = zeros(n);  % main diagonal
L = zeros(n);  % lower triangular part
U = zeros(n);  % upper triangular part
for i=1:n,
  for j=1:n,
    if (j<i)
      L(i,j) = -A(i,j);
    elseif (j == i)
      D(i,j) = A(i,j);
    else
      U(i,j) = -A(i,j);
    end
  end
end
fprintf('[1] DECOMPOSITION OF A \n');
fprintf('DIAGONAL MATRIX D IS: \n');
disp(D);
fprintf('LOWER TRIANGULAR MATRIX L IS: \n');
disp(L);
fprintf('UPPER TRIANGULAR MATRIX U IS: \n');
disp(U);

% CHECK CONVERGENCE
M = D-L;
N = U;
invM = inv(M);
T = invM * N;
fprintf('[2] MATRICES M, N, T:\n');
fprintf('MATRIX M = D-L: \n');
disp(M);
detM = det(M);
if (detM == 0)
  error('DETERMINANT OF M IS detM = %f = 0(GAUSS-SEIDEL NOT APPLICABLE) \n', detM);
else
  fprintf('DETERMINANT OF M IS detM = %f /= 0 (GAUSS-SEIDEL IS APPLICABLE) \n', detM);
end
fprintf('MATRIX N = U: \n');
disp(N);
fprintf('MATRIX T = inv(M)*N: \n');
disp(T);
nT1 = norm(T,1);
if (nT1 >= 1)
  fprintf('[3] CHECKING L1-norm of T:  ||T||_1 = %f >= 1 (NOT ACCEPTABLE)\n', nT1);
  nTinf = norm(T,inf);
  if (nTinf >= 1)
    fprintf('[3] CHECKING L_inf-norm of T:  ||T||_inf = %f >= 1 (NOT ACCEPTABLE)\n', nTinf);
    specrad = max(abs(eig(T)));  % spectral radius of T
    if (specrad >= 1)
      error('[17] CHECKING SPECTRAL RADIUS OF T IS %d >= 1 ### GAUSS-SEIDEL IS NOT CONVERGENT \n', specrad);
    else
      fprintf('[3] CHECKING SPECTRAL RADIUS OF T IS %d < 1 ### GAUSS-SEIDEL IS CONVERGENT \n', specrad);
    end
  else
    fprintf('[3] CHECKING L_inf-norm of T:  ||T||_inf = %f < 1 (GAUSS-SEIDEL METHOD CONVERGENCE GUARANTEED) \n', nTinf);
  end
else
  fprintf('[3] CHECKING L1-norm of T:  ||T||_1 = %f < 1 (GAUSS-SEIDEL METHOD CONVERGENCE GUARANTEED) \n', nT1);
end
fprintf('\n');

% START ITERATIONS
c = 0;
k = 0;  % iterations counter
while (c == 0),
  k = k+1;
  fprintf('ITER %d: ', k);
  for i=1:n,
    s1 = 0;
    s2 = 0;
    for j=1:i-1,
      s1 = s1 + A(i,j)*y(j);
    end
    for j=i+1:n,
      s2 = s2 + A(i,j)*x(j);
    end
    y(i) = (b(i)-s1-s2)/A(i,i);
  end
  fprintf('[6-12] New approximation y = ');
  disp(y);
  % Stopping condition
  cv = norm(y-x,1)/norm(y,1);
  fprintf('[13] Stopping condition is ||y-x||/||y|| = %f ', cv);
  if (cv <= eta)
    c = 1;
    fprintf('<= %f = eta (STOP) \n\n', eta);
  else
    fprintf('> %f = eta (CONTINUE)\n\n', eta);
  end
  x = y;
end
printf('[15] COMPUTED SOLUTION x = ');
disp(y);
printf('VERIFICATION: x* = inv(A)*b = ');
tx = inv(A)*b;
disp(tx');
txn = norm(tx'-y,1);
printf('RESIDUAL: ||r|| = ||x - x*|| = %f \n\n',txn);
