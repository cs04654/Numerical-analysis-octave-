#Theofanis Georgakis 4644
#Konstadinos Gkioulis 4654
#Giorgos Koutsogiannis 4710


t = [0:0.001:30]; #time
ang = 4710/20000; #angle
bx = 3 - 4710/5000; #friction factor of motion
bang = 5 - 4710/5000; #friction factor of rotational motion
m = 9; #mass
d = 1; #distance of wheels
Iz = 0.38; #moment of inertia

#(1)
f1 = 4710/7000;
f2 = 4710/7000;
Vn1(1) = 0.001*1.344/9; #initial velociy
for i=2:30001
  Vn1(i) = Vn1(i-1) + 0.001*(((f1+f2) - bx*abs(Vn1(i-1))*Vn1(i-1))/m) ; #velocity where f1=f2
endfor;

f1 = 4710/7000;
f2 = 4710/8000;
Vn2(1) = 0.001*1.261/9; #initial velociy
for i=2:30001
  Vn2(i) = Vn2(i-1) + 0.001*(((f1+f2) - bx*abs(Vn2(i-1))*Vn2(i-1))/m) ; #velocity where f1>f2
endfor;
figure
subplot(2,1,1)
plot(t, Vn1)
xlabel("t(s)")
ylabel("V (m/s)")
title("[f1,f2]^T = [0.672,0.672]^T")
subplot(2,1,2)
plot(t, Vn2)
xlabel("t(s)")
ylabel("V (m/s)")
title("[f1,f2]^T = [0.672,0.589]^T")
saveas(1,"ex1b-1.jpg")

#(2)
f1 = 4710/7000;
f2 = 4710/7000;
ang1(1) = ang; #initial angle
ang1_d(1) = 0; #initial angle's derivative
for i=2:30001
  ang1_d(i) = ang1_d(i-1) + 0.001*(d/2*(f2-f1) - bang*abs(ang1_d(i-1))*ang1_d(i-1))/Iz; #first deravite of the angle where f1=f2
  ang1(i) = ang1(i-1) + 0.001*(ang1_d(i) - 0.001*(d/2*(f2-f1) - bang*abs(ang1_d(i-1))*ang1_d(i-1))/Iz); #angle where f1=f2
endfor;

f1 = 4710/7000;
f2 = 4710/8000;
ang2(1) = 0.235 * 0.1505*(0.001)^2; #initial angle
ang2_d(1) = -0.0415*0.001; #initial angle's derivative
for i=2:30001
  ang2_d(i) = ang2_d(i-1) + 0.001*(d/2*(f2-f1) - bang*abs(ang2_d(i-1))*ang2_d(i-1))/Iz; #first deravite of the angle where f1>f2
  ang2(i) = ang2(i-1) + 0.001*(ang2_d(i) - 0.001*(d/2*(f2-f1) - bang*abs(ang2_d(i-1))*ang2_d(i-1))/Iz); #angle where f1>f2
endfor;

figure
subplot(4,1,1)
plot(t, ang1)
xlabel("t(s)")
ylabel("angle (rad)")
title("[f1,f2]^T = [0.672,0.672]^T")
subplot(4,1,2)
plot(t, ang1_d)
xlabel("t(s)")
ylabel("angles' rate of change (rad/s)")
title("[f1,f2]^T = [0.672,0.672]^T")
subplot(4,1,3)
plot(t, ang2)
xlabel("t(s)")
ylabel("angle (rad)")
title("[f1,f2]^T = [0.672,0.589]^T")
subplot(4,1,4)
plot(t, ang2_d)
xlabel("t(s)")
ylabel("angles' rate of change (rad/s)")
title("[f1,f2]^T = [0.672,0.589]^T")
saveas(2,"ex1b-2.jpg")


#(3)
f1 = 4710/7000;
f2 = 4710/7000;
Vn3(1) = 0.001*(1.344 - abs(0.001)*0.001*0.011)/9; #initial velociy
for i=2:30001
  Vn3(i) = Vn3(i-1) + 0.001*(d/2*(f1+f2) - bx*abs(Vn3(i-1) + 0.001/2*((d/2*(f1+f2) - bx*abs(Vn3(i-1))*Vn3(i-1))/m))*(Vn3(i-1) + 0.001/2*((d/2*(f1+f2) - bx*abs(Vn3(i-1))*Vn3(i-1))/m)))/m  ; #velocity where f1=f2 (modified euler)
endfor;
f1 = 4710/7000;
f2 = 4710/8000;
Vn4(1) = 0.001*(1.261 - abs(0.001)*0.001*0.005)/9; #initial velociy
for i=2:30001
  Vn4(i) = Vn4(i-1) + 0.001*(d/2*(f1+f2) - bx*abs(Vn4(i-1) + 0.001/2*((d/2*(f1+f2) - bx*abs(Vn4(i-1))*Vn4(i-1))/m))*(Vn4(i-1) + 0.001/2*((d/2*(f1+f2) - bx*abs(Vn4(i-1))*Vn4(i-1))/m)))/m  ; #velocity where f1>f2 (modified euler)
endfor;

figure
subplot(2,1,1)
plot(t, Vn3)
xlabel("t(s)")
ylabel("V (m/s)")
title("[f1,f2]^T = [0.672,0.672]^T (modified euler)")
subplot(2,1,2)
plot(t, Vn4)
xlabel("t(s)")
ylabel("V (m/s)")
title("[f1,f2]^T = [0.672,0.589]^T (modified euler)")
saveas(3,"ex1b-3.jpg")


#(4)
f1 = 4710/7000;
f2 = 4710/7000;
ang3(1) = ang; #initial angle
ang3_d(1) = 0; #initial angle's derivative
for i=2:30001
  ang3_d(i) = ang3_d(i-1) + 0.001*(d/2*(f2-f1) - bang*abs(ang3_d(i-1) + 0.001/2*(d/2*(f2-f1) - bang*abs(ang3_d(i-1))*ang3_d(i-1))/Iz)*(ang3_d(i-1) + 0.001/2*(d/2*(f2-f1) - bang*abs(ang3_d(i-1))*ang3_d(i-1))/Iz))/Iz; #first deravite of the angle where f1=f2 (modified euler)
  ang3(i) = ang3(i-1) + 0.001*(ang3_d(i) - 0.001*(d/2*(f1-f2) - bang*abs(ang3_d(i-1) + 0.001/2*(d/2*(f2-f1) - bang*abs(ang3_d(i-1))*ang3_d(i-1))/Iz)*(ang3_d(i-1) + 0.001/2*(d/2*(f2-f1) - bang*abs(ang3_d(i-1))*ang3_d(i-1))/Iz))/Iz); #angle where f1=f2 (modified euler)
endfor;

f1 = 4710/7000;
f2 = 4710/8000;
ang4(1) = 0.235; #initial angle
ang4_d(1) = 0; #initial angle's derivative
for i=2:30001
  ang4_d(i) = ang4_d(i-1) + 0.001*(d/2*(f2-f1) - bang*abs(ang4_d(i-1) + 0.001/2*(d/2*(f2-f1) - bang*abs(ang4_d(i-1))*ang4_d(i-1))/Iz)*(ang4_d(i-1) + 0.001/2*(d/2*(f2-f1) - bang*abs(ang4_d(i-1))*ang4_d(i-1))/Iz))/Iz; #first deravite of the angle where f1=f2 (modified euler)
  ang4(i) = ang4(i-1) + 0.001*(ang4_d(i) - 0.001*(d/2*(f1-f2) - bang*abs((ang4(i-1) + 0.001/2*ang4_d(i-1)) + 0.001/2*(d/2*(f2-f1) - bang*abs((ang4(i-1) + 0.001/2*ang4_d(i-1)))*(ang4(i-1) + 0.001/2*ang4_d(i-1)))/Iz)*((ang4(i-1) + 0.001/2*ang4_d(i-1)) + 0.001/2*(d/2*(f2-f1) - bang*abs((ang4(i-1) + 0.001/2*ang4_d(i-1)))*(ang4(i-1) + 0.001/2*ang4_d(i-1)))/Iz))/Iz); #angle where f1>f2 (modified euler)
endfor;

figure
subplot(4,1,1)
plot(t, ang3)
xlabel("t(s)")
ylabel("angle (rad)")
title("[f1,f2]^T = [0.672,0.672]^T (modified euler)")
subplot(4,1,2)
plot(t, ang3_d)
xlabel("t(s)")
ylabel("angles' rate of change (rad/s)")
title("[f1,f2]^T = [0.672,0.672]^T (modified euler)")
subplot(4,1,3)
plot(t, ang4)
xlabel("t(s)")
ylabel("angle (rad)")
title("[f1,f2]^T = [0.672,0.589]^T (modified euler)")
subplot(4,1,4)
plot(t, ang4_d)
xlabel("t(s)")
ylabel("angles' rate of change (rad/s)")
title("[f1,f2]^T = [0.672,0.589]^T (modified euler)")
saveas(4,"ex1b-4.jpg")

