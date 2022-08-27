%calculating Newton Cotes rules
%ypologizoume sunartishs kai grafoume @(x) kai meta thn ejisosh.
f = input('ENTER THE FUNTION:');
Number = input('ENTER THE NUMBER OF TRAPEZOIDS:');
Lower = input('ENTER THE LOWER LIMIT FOR INTEGRATION:');
Upper = input('ENTER THE HIGHEST LIMIT FOR INTEGRATION:');
Step = (Upper - Lower)/Number;
Sum = 0;
for i=1:Number-1
  Sum = Sum + f(Lower+i*Step);
endfor
Trapezoid = (Step/2)*(f(Lower)+f(Upper)+2*Sum);
fprintf('Result using trapezoid rule : %6f\n',Trapezoid)

Sum2 = 0;
for j=1:2:Number-1
  Sum2 = Sum2 + f(Lower+j*Step);
endfor
Sum3 = 0;
for k=2:2:Number-2
  Sum3 = Sum3 + f(Lower+k*Step);
endfor
Simpson_one_third = (Step/3)*(f(Lower)+f(Upper)+4*Sum2+2*Sum3);
fprintf('Result using one third rule : %6f\n',Simpson_one_third)
Sum4 = 0;
for a = 3:3:Number-1
  Sum4 = Sum4 + f(Lower+Step*a)
endfor
Sum5 = 0;
for m = 1:Number-1
  Sum5 = Sum5 + f(Lower+m*Step);
endfor
Simpson_trhee_eights = (3*(Step/8))*(f(Lower)+f(Upper)+3*(Sum5-Sum4)+2*Sum4);
fprintf('Result using trhee eights rule : %6f\n',Simpson_trhee_eights)