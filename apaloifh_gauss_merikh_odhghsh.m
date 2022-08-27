% PROGRAM 4
% Gauss elimination for the system Hx=b.

function x = apaloifh_gauss_merikh_odhghsh(H,b)

A = [H b];  % augmented system matrix
[m,n]=size(A);
x = [];

% ELIMINATION PHASE 
printf('*** ELIMINATION PHASE ***\n');
for i=1:m-1,
  printf('[2] Processing row %d...\n', i);
  % Partial Pivoting
  [val,pos] = max(abs(A(i:end,i)));  % maximum absolute pivot
  npos = i-1+pos;
  printf('\t [3] Largest absolute pivot is |A(%d,%d)|=|%f|\n', pos,i,A(npos,i));
  if (npos != i)
    printf('\t [5] Rows %d and %d are exchanged:\n',i, npos); 
    z = A(i,:);
    A(i,:) = A(i-1+pos,:);  % exchange lines
    A(i-1+pos,:) = z;
  end
  display(A);
  % Eliminate variables
  for j=i+1:m,
    a = -A(j,i)/A(i,i);
    printf('\t [8] Multiplier for row %d is a=%f \n', j, a);
    for k=i:n,
      A(j,k) = A(j,k) + a*A(i,k);
    end
    printf('\t [9] Matrix with updated row %d is:\n',j);
    display(A);
  end
end
printf('Elimination phase finished!\n\n');

% BACK-SUBSTITUTION PHASE
printf('*** BACK-SUBSTITUTION PHASE ***\n');
for i=m:-1:1,
  printf('[12] Processing row %d...\n', i);
  sum = 0;
  for j=i+1:n-1,
    sum = sum + A(i,j)*x(j);
  end
  printf('\t [13-16] Sum is s=%f \n', sum);
  x(i) = (A(i,n) - sum)/A(i,i);
  printf('\t [17] x(%d)=%f \n',i,x(i));
end
printf('[19] SOLUTION x is: ');
display(x);
printf('Residual r=Ax-b for verification: ');
r = H*x'-b;
display(r');


