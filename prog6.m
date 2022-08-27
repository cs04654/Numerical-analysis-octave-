% PROGRAM 6
% Matrix inversion.

function prog6(H)

[m,m] = size(H);
I = eye(m);
A = [H I];
[m,n] = size(A);

% ELIMINATION PHASE 
printf('*** STARTING ELIMINATION ***\n');
for i=1:m,
  printf('[2] Processing row %d...\n', i);
  % Partial Pivoting
  [val,pos] = max(abs(A(i:end,i)));  % maximum absolute pivot
  npos = i-1+pos;
  printf('\t [3] Largest absolute pivot is |A(%d,%d)|=|%f|\n', pos,i,A(npos,i));
  if (npos != i)
    printf('\t [5] Rows %d and %d are exchanged:\n',i, npos); 
    z = A(i,:);
    A(i,:) = A(i-1+pos,:);  % exchange rows
    A(i-1+pos,:) = z;
  end
  printf('\t [7] Setting pivot element to 1 \n');
  A(i,:) = A(i,:)/A(i,i);
  display(A);
  % Eliminate variables above i
  for j=1:i-1,
    a = -A(j,i)/A(i,i);
    printf('\t [9] Multiplier for row %d is a=%f \n', j, a);
    for k=i:n,
      A(j,k) = A(j,k) + a*A(i,k);
    end
    printf('\t [10] Matrix with updated row %d is:\n',j);
    display(A);
  end
  % Eliminate variables below i
  for j=i+1:m,
    a = -A(j,i)/A(i,i);
    printf('\t [13] Multiplier for row %d is a=%f \n', j, a);
    for k=i:n,
      A(j,k) = A(j,k) + a*A(i,k);
    end
    printf('\t [14] Matrix with updated row %d is:\n',j);
    display(A);
  end
end
printf('Elimination phase finished!\n\n');

% DETERMINANT COMPUTATION
invA = A(:,m+1:end);
printf('[18] The computed inverse matrix inv(A) is:\n');
disp(invA);
printf('VERIFICATION: Embedded inverse INV(A) is:\n');
disp(inv(H));
printf('Product A*inv(A) is: \n');
disp(H*invA);
printf('Product inv(A)*A is: \n');
disp(invA*H);

