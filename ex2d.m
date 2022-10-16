#Theofanis Georgakis 4644
#Konstadinos Gkioulis 4654
#Giorgos Koutsogiannis 4710


d = 1; #distance of wheels
Iz = 0.38; #moment of inertia
Kp = 5; 
Kd = 15 + 4710/1000;
bang = 5 - 4710/5000; #friction factor of rotational motion
angdes = - 4710/10000; #desired angle
t = [0:0.001:30];

D = (d/2*Kd + bang)^2 - 2*Iz*Kp*d; #characteristic equation's discriminant  
r1 = (-(d/2*Kd + bang) + sqrt(D))/(2*Iz); #first root
r2 = (-(d/2*Kd + bang) - sqrt(D))/(2*Iz); #second root

c2 = (r1*angdes)/(r2-r1); #first factor of G.S.
c1 = - c2 - angdes; #second factor of G.S.

ang1 = c1*exp(r1.*t) + c2*exp(r2.*t) + angdes; #angle
ang1_d = r1*c1*exp(r1.*t) + r2*c2*exp(r2.*t); #derivative of angle

figure
subplot(2,1,1)
plot(t,ang1)
xlabel("t(s)")
ylabel("angle (rad)")
title("analytical solution of angle")
subplot(2,1,2)
plot(t,ang1_d)
xlabel("t(s)")
ylabel("angle (rad)")
title("analytical solution of angle's derivative")
saveas(1,"ex2d.jpg")