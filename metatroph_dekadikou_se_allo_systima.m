% PROGRAM 2
% Transformation of decimal part of a real number x given in the decimal 
% system to its corresponding representation in another system of base b.

function metatroph_dekadikou_se_allo_systima = metatroph_dekadikou_se_allo_systima(x,b,imax)

printf('Input: x=%f, b=%d\n',x,b);
i = 0;
y = x;
printf('[1]: i=%d, y=%f\n',i,y);
printf('-------------------\n');
while (y ~= 0)&&(i < imax),
  printf('[2]: WHILE-loop (y=%f ~= 0) && (i=%d < imax=%d) is (1=true/0=false): 1\n',y,i,imax);
  i = i+1;
  printf('[3]:      i=%d\n',i);
  d(i) = floor(y*b);
  printf('[4]:      d(-%d)=floor(%f*%d)=%d\n',i,y,b,d(i));
  y = (y*b)-d(i);
  printf('[5]:      updated y=(y*b)-d(%d)=%f\n',i,y);
  printf('[6]: WHILE-loop ends\n');
  printf('-------------------\n');
end
printf('[2]: WHILE-loop (y=%f ~= 0) && (i=%d < imax=%d) is (1=true/0=false): 0\n',y,i,imax);
printf('[7]: d = [ ');
for j=1:i,
  printf('%d ',d(j));
end
printf(']\n');
if (i>=imax)
  printf('Note: no finite representation was found in %d iterations\n',imax);
end