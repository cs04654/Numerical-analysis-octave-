pkg load symbolic; %load symbolic
syms t;  %symbolic t
ut = heaviside(t); % u(t)
x1t = exp(-2*abs(t)); %x1(t)
x2t = 1/(1+(t^2));  %x2(t)
x3t = sign(t);  %x3(t)
x4t = exp(-(t^2/8)); %x4(t)
x5t = exp(-2*t)*ut; %x5(t)
fourier(x1t) %fourier of x1(t)
fourier(x2t) %fourier of x2(t)
fourier(x3t) %fourier of x3(t)
fourier(x4t) %fourier of x4(t)
fourier(x5t) %fourier of x5(t)

