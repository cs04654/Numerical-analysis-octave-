%calculating the coefficients of a cubic spline a,b,c,d  
t = [0,1,2,3]; 
y = [exp(0),exp(1),exp(2),exp(3)];
N = length(t); %number of points
n = N - 1; %number of intervals
h = (t(N)-t(1))/n; % step
Trid = diag(4*ones(1,n-1)) + diag(ones(1,n-2),1) + diag(ones(1,n-2),-1); % "A" matrix for Ac = Q
for i = 1 : n - 1
	z(i) = 3/h^2*(y(i+2) -2*y(i+1)+y(i)); % "h" of the matrix
end
z = z';  %h transpose
w = inv(Trid)*z;  %inverse of "A" matrix multiplied by h
sigma = [0;w;0]; %the sigma solution of the Ac=q
for i = 1 : n
	a(i) = y(i);%"A" coefficient
	c(i) = sigma(i);%"C" coefficient
	d(i) = (sigma(i+1) - sigma(i))/(3*h);%"D" coefficient
	b(i) = (y(i+1) - y(i))/h - h/3*(2*sigma(i)+sigma(i+1)); %"B" coefficient
end
r = 8; 
hh = h/r; %step size%step size
x = t(1):hh:t(N);
for i=1:n
	for j = r*(i-1)+1:r*i
		s(j) = d(i)*(x(j)-t(i))^3 + c(i)*(x(j)-t(i))^2 + b(i)*(x(j)-t(i)) + a(i);%the actual points
	end
end
s(r*n+1)=y(N);