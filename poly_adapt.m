% poly_adapt(0:0.5:3,0.5,yi)

function poly_adapt = poly_adapt(xi,h,yi)
  table_size = size(yi)(2);
  data_table = alpha(xi,h,yi,table_size);
  n = data_table(2);
  c = data_table(3);
  a(n+1) = data_table(1);
  for i = 1:1:table_size
    yi(i) = yi(i) - a(n+1)*xi(i)^n;
  endfor 
  for i = n-1:-1:1
    data_table = alpha(xi,h,yi,table_size);
    a(i+1) = data_table(1);
    for j = 1:1:table_size
      yi(j) = yi(j) - a(i+1)*xi(j)^i;
    endfor
  endfor
  a(1) = yi(1);
  flip(a)
endfunction

function alpha = alpha(xi,h,yi,s)
  class = 1;
  same_diff = 0;
  cycle = s;
  for i = 1:1:cycle
    diff(1, i) = yi(i);
  endfor
  cycle--;
  while (same_diff == 0)
    for i = 1:1:cycle
      diff(class + 1,i) = diff(class,i+1)-diff(class,i);
    endfor
    cycle--;
    class++;
    same_diff = 1;
    for i = 1:1:cycle
      if (diff(class,i) != diff(class, i+1))
        same_diff = 0;
      endif
    endfor
  endwhile
  c = diff(class, 1);
  n = class - 1;
  a = c/(factorial(n)*h^n);
  alpha = [a, n, c];
endfunction 