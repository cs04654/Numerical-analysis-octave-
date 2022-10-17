%AM 4654 , 4640
pkg load symbolic;
t = 0:0.01:2*pi; #Space of [0,2pi] with 0.01 step
xt = cos((1.3*pi)*t); 
figure(1);
plot(t,xt); #Plot of xt 
saveas(1, "ask2_a.jpg"); #Save the graph as jpg
n = 0:50; #Space of [0,50]
xn = sin((1.8*pi/10)*n);
figure(2);
stem(n,xn); #Stem of xn
saveas(2, "ask2_b.jpg"); #Save the graph as jpg

syms t;

u = heaviside(t);
ut1 = heaviside(t+1);
ut2 = heaviside(t-1);

x = (e^(-t))*u;
y = (e^(-(t+1)))*ut1;
z = (e^(-(t-1)))*ut2;

figure(3);
subplot(3,1,1,"align");
ezplot(t,x, [-4 4 0 1]);
subplot(3,1,2,"align");
ezplot(t,y, [-4 4 0 1]);
subplot(3,1,3,"align");
ezplot(t,z, [-4 4 0 1]);
saveas(3, "ask2_c.jpg");