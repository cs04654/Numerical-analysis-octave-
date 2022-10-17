figure(1);
k = [-15:1:15];
x0 = 1/2;
xk = (1./(pi*k)).*(sin((pi*k)/2)); %suntelestes fourier
xk(16) = x0;  # 1/2 in the 16th position
h = abs(xk);  #absolut value of xk
subplot(2,1,1,"align"); #put the two plots in one figure
stem(k,h);  #diagram
xlabel("xk");  #labeling
ylabel("abs(xk)"); #labeling
y = angle(xk);  #phase of xk
subplot(2,1,2,"align"); #put the second plot in the figure
stem(k,y);  #diagram
xlabel("xk");  #labeling
ylabel("phase(xk)"); #labeling
saveas(1, "ask1_1.jpg");  #save
t = [-3:0.01:3];
y = 2;
for N = [3,5,9,31,50,500,1000];
  x = zeros(1,length(t));
  p = 0;
  
  for kt = 1:N;  
    xkt = (1/(pi*kt))*(sin((pi*kt)/2)); %suntelestes fourier
    x = x + xkt*e.^(j*pi*kt*t); 
    p = (p + (1/pi*kt).^2)*0.001;
  endfor
  p = p + x0^2;
  p = p*2;
  figure(y);  
  plot(t,x);
  xlabel("t");  #labeling
  ylabel("fourier xt"); #labeling
  title(sprintf("%d OROI ,%d  Isxis" , N ,p));
  saveas(y, sprintf("ask1_%d.jpg" , y));  #save
  y++;
endfor


