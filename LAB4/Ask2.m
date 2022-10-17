pkg load symbolic;  %load symbolic
figure(1); 
f = [-10:0.01:10]; % f = [-10:0.01:10]
t = [0:0.01:10];  % t = [0:0.01:10]
ut = heaviside(t); % u(t)
xt = exp(-2*t).*ut;  % x(t)
x = 1./((i*2*pi*f)+2); % x fourier
subplot(3,1,1,"align");  
plot(t,xt);
title("fourier tranfer of xt, t = [0,10]");
xlabel("t");
ylabel("xt");
subplot(3,1,2,"align");
xy = abs(x);  %amplitude
plot(f,xy);
title("amplitude of x(t), t = [-10,10]");
xlabel("f");
ylabel("abs(xt)");
xz = angle(x);  %fash
subplot(3,1,3,"align");
plot(f,xz);
title("phase of x(t), t = [-10,10]");
xlabel("f");
ylabel("angle(xt)");
saveas(1,"Ask2.jpg");