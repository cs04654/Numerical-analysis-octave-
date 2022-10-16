#Theofanis Georgakis 4644
#Konstadinos Gkioulis 4654
#Giorgos Koutsogiannis 4710


#(1)
d=1; #distance of wheels
Kp1 = [0.1:1:100];
Kd1 = 15;
Iz = 0.38;
bang = 4 - 4710/5000; #friction factor of rotational motion
angdes = - 4710/10000; #desired angle

s0(1:1:100) = 0; #permanent third pole
s1 = (-d/2*Kd1-bang+sqrt((d/2*Kd1 + bang)^2 - 2*d*Iz*Kp1))/(2*Iz); #first pole
s2 = (-d/2*Kd1-bang-sqrt((d/2*Kd1 + bang)^2 - 2*d*Iz*Kp1))/(2*Iz); #second pole

figure
subplot(3,1,1)
plot(Kp1, s1)
xlabel("Kp")
ylabel("s1 (real part)")
title("Kp to poles graph (Kd = 15)")
subplot(3,1,2)
plot(Kp1, s2)
xlabel("Kp")
ylabel("s2 (pole)")
title("Kp to poles graph(Kd = 15)")
subplot(3,1,3)
plot(Kp1, s0)
xlabel("Kp")
ylabel("s3 (pole)")
title("Kp to poles graph (Kd = 15)")
saveas(1,"ex2b-1.jpg")

figure
subplot(3,1,1)
plot(Kp1, imag(s1))
xlabel("Kp")
ylabel("s1 (imaginary part)")
title("Kp to poles graph (Kd = 15)")
subplot(3,1,2)
plot(Kp1, s2)
xlabel("Kp")
ylabel("s2 (pole)")
title("Kp to poles graph(Kd = 15)")
subplot(3,1,3)
plot(Kp1, s0)
xlabel("Kp")
ylabel("s3 (pole)")
title("Kp to poles graph (Kd = 15)")
saveas(1,"ex2b-1.jpg")


#(2)
Kp2 = 5;
Kd2 = [0.1:1:100];
s3 = (-d/2*Kd2-bang+sqrt((d/2*Kd2 + bang).^2 - 2*d*Iz*Kp2))/(2*Iz); #first pole
s4 = (-d/2*Kd2-bang-sqrt((d/2*Kd2 + bang).^2 - 2*d*Iz*Kp2))/(2*Iz); #second pole

figure
subplot(3,1,1)
plot(Kd2, s3)
xlabel("Kd")
ylabel("s1 (pole)")
title("Kd to poles graph (Kp = 5)")
subplot(3,1,2)
plot(Kd2, s4)
xlabel("Kd")
ylabel("s2 (pole)")
title("Kd to poles graph (Kp = 5)")
subplot(3,1,3)
plot(Kd2, s0)
xlabel("Kd")
ylabel("s3 (pole)")
title("Kd to poles graph (Kp = 5)")
saveas(2,"ex2b-2.jpg")