% PROGRAM 1
% Transformation of integer part of a real number x given in the decimal 
% system to its corresponding representation in another system of base b.

function metatroph_se_allo_systima = metatroph_se_allo_systima(x,b)

printf('Input: x=%d, b=%d\n',x,b);
i = -1;
y = x;
printf('[1]: i=%d, y=%d\n',i,y);
printf('-------------------\n');
while (y >= b),
  printf('[2]: WHILE-loop condition (y=%d >= b=%d) is (1=true/0=false): %d\n',y,b,y>=b);
  i = i+1;
  printf('[3]:      i=%d\n',i);
  j = i+1;
  d(j) = mod(y,b);
  printf('[4]:      d(%d)=mod(%d,%d)=%d\n',i,y,b,d(j));
  y = (y-d(j))/b;
  printf('[5]:      updated y=(y-d(%d))/b=%d\n',i,y);
  printf('[6]: WHILE-loop ends\n');
  printf('-------------------\n');
end
printf('[2]: WHILE-loop condition (y=%d >= b=%d) is (1=true/0=false): %d\n',y,b,y>=b);
i = i+1;
printf('[7]: i=%d\n',i);
j = i+1;
d(j) = y;
n = j;
printf('[8]: d(%d)=y=%d\n',i,y);
printf('[9]: FINAL d=[ ');
for j=n:-1:1,
  printf('%d ',d(j));
end
printf(']\n\n');
