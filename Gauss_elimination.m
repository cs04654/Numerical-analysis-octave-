% PROGRAM 5
% Gauss elimination for computation of determinant detA.

function Gauss_elimination = Gauss_elimination(A)

[m,n] = size(A);
detmult = 1;  % determinant multiplier due to row exchanges or single row multiplications
embdet = det(A);  % Embedded determinant function (for verification purpose)

% ELIMINATION PHASE 
printf('*** STARTING ELIMINATION ***\n');
for i=1:n-1,
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
    detmult = detmult * (-1);  % multiply determinant by (-1) due to row exchange
  end
  display(A);
  % Eliminate variables
  for j=i+1:m,
    a = -A(j,i)/A(i,i);
    printf('\t [9] Multiplier for row %d is a=%f \n', j, a);
    for k=i:n,
      A(j,k) = A(j,k) + a*A(i,k);
    end
    printf('\t [10] Matrix with updated row %d is:\n',j);
    display(A);
  end
end
printf('Elimination phase finished!\n\n');

% DETERMINANT COMPUTATION
detA = detmult*prod(diag(A));
printf('[14] det(A)=%e\n', detA);
printf('VERIFICATION: Embedded determinant DET(A)=%e\n', embdet);
printf('Residual det(A)-DET(A)=%e \n\n', abs(embdet-detA));


