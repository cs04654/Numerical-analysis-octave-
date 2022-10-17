%AM 4654 , 4640
%arithmetic way
pkg load symbolic;
t = -10000:0.01:10000;  %xx' time
x = (exp((-2)*abs(t)));  %function
sq_x = x.^2; #squared
result = (((0.01))*sum(abs(sq_x))); #result
printf("arithmetic result: \n\n result = %d \n\n",result);

%symbolic way

syms tn;  #define tn
xn = exp((-2)*abs(tn)); %function
sq_xn = xn.^2; #squared
sym_result = int(sq_xn, tn, -inf, inf);

printf("symbolic result: \n\n sym_result = %s \n",char(sym_result));
