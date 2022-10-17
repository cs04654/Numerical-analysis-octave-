%AM 4654 , 4640
figure(1);
n1 = -10:0.01:0;
n2 = 0:0.01:10;
n3 = 10:0.01:30;
n = [n1 n2 n3]; #group x axis
x1 = zeros(size(n1));   #set y to zero for range of n1
x2 = ones(size(n2));   #set y to one for range of n2
x3 = zeros(size(n3));    #set y to zero for range of n3
xn = [x1 x2 x3];  #group y axis
stem(n,xn);  %plot
xlabel('n');  %label
ylabel('xn');  %label
saveas(1, "ask4_a.jpg");  #save
figure(2);
u1 = [-10:0.01:0];
u2 = [0:0.01:30];
u = [u1 u2 30];  %array from -10 to 30
un1 = zeros(size(u1));
un2 = ones(size(u2));
un = [un1 un2 1];  % u(n)
hn = [((5/8).^u).*un];  %h(n)
stem(u,hn); %plot
xlabel('n');  %label
ylabel('hn');  %label
saveas(2, "ask4_b.jpg"); 
figure(3);
y = [-20 -20 -20:0.01:60 60 60]; #array from -20 to 60
yn = conv(xn,hn);
stem(y,yn); %plot
xlabel('n');  %label
ylabel('yn');  %label
saveas(3, "ask4_c.jpg"); 