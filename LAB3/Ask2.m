figure(1);
f = [-60:60];
hf = 1./(3+j*2*pi*f); %functiion
subplot(2,1,1,"align"); #put the two plots in one figure
plot(f,abs(hf));
xlabel("Hz");  #labeling
ylabel("abs(hf)"); #labeling
title("H(f)"); %title
subplot(2,1,2,"align"); #put the two plots in one figure
plot(f,angle(hf));
xlabel("Hz");  #labeling
ylabel("angle(hf)"); #labeling
title("phase H(f)"); %title
saveas(1, "ask2_1.jpg");  #save
figure(2);
hf2 = (2+j*pi*f)./(3+j*pi*f);  %functiion
subplot(2,1,1,"align"); #put the two plots in one figure
plot(f,abs(hf2));
xlabel("Hz");  #labeling
ylabel("abs(hf)"); #labeling
title("H(f)"); %title
subplot(2,1,2,"align"); #put the two plots in one figure
plot(f,angle(hf2));
xlabel("Hz");  #labeling
ylabel("angle(hf)"); #labeling
title("phase H(f)"); %title
saveas(2, "ask2_2.jpg");  #save