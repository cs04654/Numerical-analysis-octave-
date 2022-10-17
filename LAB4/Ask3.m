figure(1);
t = [0:0.0001:1]; %time
n = [0:50]; %steps
T = 0.02; % Ts
xt = 2*sin(8*pi*t) - cos(6*pi*t);  %x(t)
xn = 2*sin(8*pi*n*T) - cos(6*pi*n*T); % x(n)
subplot(2,1,1,"align");
plot(t,xt);
title("continuous time xt, t = [0,1] , for Ts = 0.02");
xlabel("t");
ylabel("xt");
subplot(2,1,2,"align");
stem(n,xn);  %stem
hold on;
plot(n,xn); %plot
title("discrete time xt, n = [0,50] , for Ts = 0.02");
xlabel("n");
ylabel("xn");
saveas(1,"Ask3_1.jpg");
figure(2);
Tn = 0.3; % new Ts
xt2 = 2*sin(8*pi*t) - cos(6*pi*t); %x(t)
xn2 = 2*sin(8*pi*n*Tn) - cos(6*pi*n*Tn); % x(n)
subplot(2,1,1,"align");
plot(t,xt2);
title("continuous time xt, t = [0,1] , for Ts = 0.3");
xlabel("t");
ylabel("xt");
subplot(2,1,2,"align");
stem(n,xn2);
hold on;
plot(n,xn2);
title("discrete time xt, n = [0,50] , for Ts = 0.3");
xlabel("n");
ylabel("xn");
saveas(2,"Ask3_2.jpg");

