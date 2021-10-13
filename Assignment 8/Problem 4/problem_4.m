clear; close all;

%let w(1) = x, w(2) = y, w(3) = v
a = @(w,t) [sin(w(1))*sin(w(2)) , 1 - exp(sin(w(1) + w(2)))];
b = @(w,t) -cos(w(1))*sin(w(2)) + exp(sin(w(1)+w(2)))*cos(w(1)+w(2));
f = @(w,t) sin(w(1) + w(2))^2;
g = @(w,t) [a(w,t) , b(w,t)*w(3)];

h = 0.01;
T = [0.75,1.0,1.25];
Nt = round(T/h);

xi = 3.9;
eta = 2.3;
a0 = [xi,eta];

y = linspace(0,2*pi,300);

%part 1
m = numel(y);
u_sol = zeros(m,1);
U1 = zeros(m,3);
U2 = zeros(m,3);
t0 = 0;


for j = 1:3
    for i = 1:m
        a0_1 = [3.9,y(i)];
        a0_2 = [2.5,y(i)];
        [u_sol_1(i),tv1] = method_of_characteristics_2D(a,b,g,f,a0_1,t0,T(j),h);
        [u_sol_2(i),tv2] = method_of_characteristics_2D(a,b,g,f,a0_2,t0,T(j),h);
    end
    U1(:,j) = u_sol_1;
    U2(:,j) = u_sol_2;
end

figure(1)
hold on; grid on;

plot(y, U1(:,1),'linewidth',1)
plot(y, U1(:,2),'linewidth',1)
plot(y, U1(:,3),'linewidth',1)

legend('t=0.75','t=1.0','1.25','fontsize',14)
xlabel('y','fontsize',14)
ylabel('u(x,y,t)','fontsize',14)
title('u vs y for fixed x = 3.29, varying time levels','fontsize',14)
saveas(gcf,'p4_1','epsc')

%part 2

figure(2)
hold on; grid on;

plot(y, U2(:,1),'linewidth',1)
plot(y, U2(:,2),'linewidth',1)
plot(y, U2(:,3),'linewidth',1)

legend('t=0.75','t=1.0','1.25','fontsize',14)
xlabel('y','fontsize',14)
ylabel('u(x,y,t)','fontsize',14)
title('u vs y for fixed x = 2.5, varying time levels','fontsize',14)
saveas(gcf,'p4_2','epsc')


