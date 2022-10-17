clear all;
close all;
##Ask2.a
figure(1);
x = [7,6,5,4,4,4,4,10,10,10,8,8,7,6,0];
stem(x);
title("X(n)");
xlabel("n");
ylabel("X(n)");
saveas(1, "ask2_1_1.jpg");  #save
yn = zeros(1,length(x));
yn(1) = 0;
for n = [2:14]
  yn(n) = x(n) - x(n-1) ;
endfor  
figure(2);
stem(yn);
title("Y(n)");
xlabel("n");
ylabel("Y(n)");
saveas(2, "ask2_1_2.jpg");  #save
%%%%%%%%%%%%%%%%
##Ask2.b
figure(3);
w = [-pi:0.01:pi];
%h = 1-cos(w)+j*sin(w);
h = 2*abs(sin(w./2)).*exp(-j*atan(sin(w)./(1-cos(w))));
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
saveas(3, "ask2_2_1.jpg");  #save
%%%%%%%
clear all;
figure(4);
w = [-3*pi:0.01:3*pi];
%h = 1-cos(w)+j*sin(w);
h = 2*abs(sin(w./2)).*exp(-j*atan(sin(w)./(1-cos(w))));
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
saveas(4, "ask2_2_2.jpg");  #save
%%%%%%%%%%%%%%%%%
##Ask2.c
clear all;
X = imread('lena.tiff');
figure(5);
imshow(X);
X = double(rgb2gray(X));
figure(6);
imshow(X,[]);
[R C] = size(X);
Y = zeros(R,C);
Z = zeros(R,C);
for n = [1:R]
  for i = [1:C]
    if (i > 1)
      Y(n,i) = X(n,i) - X(n,i-1);
    endif
    if (n > 1)
      Z(n,i) = X(n,i) - X(n-1,i);
    endif
    G(n,i) = sqrt(Y(n,i)^2+Z(n,i)^2);
  endfor
endfor
