clear all;
close all;
##Ask1.a
n = [0:40];
m = 0;
N = 4;
sn = 2*cos((pi*n)/4); %signal
en = 0.4*randn(size(n)); %noise
xn = (sn + en); %corroded signal
figure(1);
subplot(4,1,1,"align");
stem(n,sn);
title("s[n]");
ylim([-3 3]);
subplot(4,1,2,"align");
stem(n,en);
title("e[n]");
ylim([-3 3]);
subplot(4,1,3,"align");
stem(n,xn);
title("x[n]");
ylim([-3 3]);
yn = zeros(1,length(n));
yn(1) = xn(1);
yn(2) = (xn(1)+xn(2))/2;
yn(3) = (xn(1)+xn(2)+xn(3))/3;
for i = 4:41
  for M = [0:3]
    yn(i) = yn(i) + ((1/N)*(xn(i-M)));
  endfor
endfor  
subplot(4,1,4,"align");
stem(n,yn);
title("y[n]");
ylim([-3 3]);
saveas(1, "ask1_1.jpg");  #save
%%%%%%%%%%%%%%%%%%%%%%%%%%
##Ask1.b
clear all;
figure(2);
N = 11;
w = [-pi:0.01:pi];
h = sin(w.*(N/2))./(N.*sin(w./2)).*exp(-j.*w.*(N-1)./2);
subplot(2,1,1,"align");
plot(w,abs(h));
title("Amplitude, T = [-pi,pi]");
xlabel("period");
ylabel("amplitude");
axis([-pi pi]);
subplot(2,1,2,"align");
plot(w,angle(h));
title("Angle");
xlabel("period");
ylabel("phaze");
axis([-pi pi]);
saveas(2, "ask1_2.jpg");  #save
clear all;
figure(3);
N = 11;
w = [-3*pi:0.01:3*pi];
h = sin(w.*(N/2))./(N.*sin(w./2)).*exp(-j.*w.*(N-1)./2);
subplot(2,1,1,"align");
plot(w,abs(h));
xlabel("period");
ylabel("amplitude");
title("Amplitude, T = [-3pi,3pi]");
axis([-3*pi 3*pi]);
subplot(2,1,2,"align");
plot(w,angle(h));
title("Angle");
xlabel("period");
ylabel("phaze");
axis([-3*pi 3*pi]);
saveas(3, "ask1_3.jpg");  #save