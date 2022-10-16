#Theofanis Georgakis 4644
#Konstadinos Gkioulis 4654
#Giorgos Koutsogiannis 4710


t = [0:0.001:30]; #time
ang = 4710/20000; #desired angle
bx = 3 - 4710/5000; #friction factor of motion
bang = 5 - 4710/5000; #friction factor of rotational motion
m = 9; #mass
d = 1;  #distance of wheels
Iz = 0.38; #moment of inertia

#(1)
Kp = 5;
Kd = 15 + 4710/1000;
angdes = - 4710/10000;
angC(1) = 0;
angC_d(1) = 0;
for i=2:30001
  angC_d(i) = angC_d(i-1) + 0.001*(d/2*(Kp*(angdes - angC(i-1)) -Kd*angC_d(i-1)) - bang*abs(angC_d(i-1))*angC_d(i-1))/Iz; #first deravite of the angle
  angC(i) = angC(i-1) + 0.001*(angC_d(i) - 0.001*(d/2*(Kp*(angdes - angC(i-1)) -Kd*angC_d(i-1)) - bang*abs(angC_d(i-1))*angC_d(i-1))/Iz);#angle
endfor;

figure
subplot(2,1,1)
plot(t, angC)
xlabel("t(s)")
ylabel("angle (rad)")
title("Question C of desired angle")
subplot(2,1,2)
plot(t, angC_d)
xlabel("t(s)")
ylabel("angles' rate of change (rad/s)")
title("Question C of desired angle")
saveas(1,"ex1d-1.jpg")

#(2)
angC2(1) = 0;
angC2_d(1) = 0;
for i=2:30001
  angC2_d(i) = angC2_d(i-1) + 0.001*(d/2*(Kp*(angdes - angC2(i-1)) -Kd*angC2_d(i-1)) - bang*abs(angC2_d(i-1) + 0.001/2*(d/2*(Kp*(angdes - angC2(i-1)) -Kd*angC2_d(i-1)) - bang*abs(angC2_d(i-1))*angC2_d(i-1))/Iz)*(angC2_d(i-1) + 0.001/2*(d/2*(Kp*(angdes - angC2(i-1)) -Kd*angC2_d(i-1)) - bang*abs(angC2_d(i-1))*angC2_d(i-1))/Iz))/Iz; #first deravite of the angle (modified euler)
  angC2(i) = angC2(i-1) + 0.001*(angC2_d(i) - 0.001*(d/2*(Kp*(angdes - angC2(i-1)) -Kd*angC2_d(i-1)) - bang*abs(angC2_d(i-1) + 0.001/2*(d/2*(Kp*(angdes - angC2(i-1)) -Kd*angC2_d(i-1)) - bang*abs(angC2_d(i-1))*angC2_d(i-1))/Iz)*(angC2_d(i-1) + 0.001/2*(d/2*(Kp*(angdes - angC2(i-1)) -Kd*angC2_d(i-1)) - bang*abs(angC2_d(i-1))*angC2_d(i-1))/Iz))/Iz); #angle (modified euler)
endfor;

figure
subplot(2,1,1)
plot(t, angC2)
xlabel("t(s)")
ylabel("angle (rad)")
title("Question C of desired angle (modified euler)")
subplot(2,1,2)
plot(t, angC2_d)
xlabel("t(s)")
ylabel("angles' rate of change (rad/s)")
title("Question C of desired angle (modified euler)")
saveas(2,"ex1d-2.jpg")