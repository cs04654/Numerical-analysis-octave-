%AM 4654 , 4640
t1 = 0;
t2 = 0:0.01:1;
t3 = 1;
t  = [t1 t2 t3];  #time from 0 to 1
xt1 = zeros(size(t1)); %set y to zero for t=0
xt2 = ones(size(t2));  %set y to one for space t = (0 to 1)
xt3 = zeros(size(t3)); %set y to zero for t=1
xt = [xt1 xt2 xt3];     #group x axis
figure(1);
plot(t,xt,'b');  %plot
saveas(1, "ask3_a_1.jpg");  #save
h1 = 0;
h2 = 0:0.01:1;
h3 = 1;
h  = [h1 h2 h3];  #time from 0 to 1
ht1 = zeros(size(h1)); %set y to zero for t=0
ht2 = ones(size(h2));  %set y to one for space t = (0 to 1)
ht3 = zeros(size(h3)); %set y to zero for t=1
ht = [xt1 xt2 xt3];     #group x axis
figure(2);
stem(h,ht);  %plot
saveas(2, "ask3_a_2.jpg");  #save
figure(3);
y1 = [1:0.01:2];
y  = [t y1 2];  #group x axis
yt = conv(ht,xt);  #?(?)=?(?)??(?)
plot(y,yt);
saveas(3, "ask3_a_3.jpg");  #save
figure(4);
z  = [y 2:0.01:3 3];  %x axis
zt = conv(yt,ht); #?(?)=?(?)*?(?)
plot(z,zt);
saveas(4, "ask3_b.jpg");  #save
figure(5);
w  = [z 3:0.01:4 4];  %x axis
wt = conv(zt,ht); #?(?)=?(?)*?(?)
plot(w,wt);
saveas(5, "ask3_c.jpg");  #save



%Test 1

#{
h1 = 0;
h2 = 0:0.01:1;
h3 = 1;    
h  = [h1 h2 h3];   #time from 0 to 1
ht1 = ones(size(h1));  %set y to zero for t=0
ht2 = zeros(size(h2));  %set y to one for space t = (0 to 1)
ht3 = zeros(size(h3));
ht  = [ht1 ht2 ht3];  #group
figure(2);
plot(h,ht);
saveas(2, "ask3_a_2.jpg");  #save
figure(3);
y1 = 0;
y2 = 0:0.01:1;
y3 = 1;
y4 = 1:0.01:2;
y5 = 2; 
y  = [y1 y2 y3 y4 y5];
yt = conv(ht,xt);
plot(y,yt);
saveas(3, "ask3_a_3.jpg");  #save
figure(4);
z1 = 2:0.01:3;
z = [y z1 3];
zt = conv(ht,yt);
plot(z,zt);
saveas(4, "ask3_b.jpg");
figure(5);
w1 = [3:0.01:4];
w = [z w1 4];
wt = conv(ht,zt);
plot(w,wt);
saveas(5, "ask3_c.jpg");  #save 
%}

%test 2
%syms t;
%u = heaviside(t);
%ut1 = heaviside(t-1);
%xt = u - ut1;
%figure(1);
%ezplot(t,xt);
%ht = u - ut1;
%figure(2);
%ezplot(t,ht);
%zt = conv(xt,ht);
%figure(3);
%ezplot(zt);