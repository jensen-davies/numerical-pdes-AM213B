clc; clear all; close all;

dx = 0.01;
T = 0.2;

%define numerous grids
dt1 = ((dx)^2/2)*(1/0.99);
dt2 = ((dx)^2/2)*(1/1.01);

t1 = [0:dt1:T];
t2 = [0:dt2:T];

r1 = dt1/dx^2;
r2 = dt2/dx^2;

x = [0:dx:2];
N = numel(x);

%FTCS for dt1
gL1 = ones(numel(t1),1);
gR1 = zeros(numel(t1),1);
u1 = zeros(numel(t1),N);
u1(:,1) = gL1;
u1(:,N) = gR1;

for i = 1:N
    if (x(i) < 1)
        u1(1,i) = 1;
    else
        u1(1,i) = 0;
    end
end

for n = 1:(numel(t1)-1)
    for i = 2:N-1
    u1(n+1,i) = u1(n,i) + r1*(u1(n,i+1) - 2*u1(n,i) + u1(n,i-1));
    end
end

%FTCS for dt2
gL2 = ones(numel(t2),1);
gR2 = zeros(numel(t2),1);
u2 = zeros(numel(t2),N);
u2(:,1) = gL2;
u2(:,N) = gR2;

for i = 1:N
    if (x(i) < 1)
        u2(1,i) = 1;
    else
        u2(1,i) = 0;
    end
end

for n = 1:(numel(t2)-1)
    for i = 2:N-1
    u2(n+1,i) = u2(n,i) + r2*(u2(n,i+1) - 2*u2(n,i) + u2(n,i-1));
    end
end

figure(1)
hold on; box on; grid on;

%plotting solution at requested times
plot(x, u1(199,:))
plot(x, u1(793,:))
plot(x, u1(1783,:))
plot(x, u1(3961,:))
title('Figure for $$\Delta t = \frac{(\Delta x)^2}{2}\frac{1}{0.99}$$, outside stability threshold', 'interpreter','latex')
xlabel('x','fontsize',14)
ylabel('u(x,t)','fontsize',14)
legend('t = 0.01','t = 0.04','t = 0.09','t = 0.2','fontsize',14)

hold off;

figure(2)
hold on; box on; grid on;

plot(x,u2(203,:))
plot(x,u2(809,:))
plot(x,u2(1819,:))
plot(x,u2(4041,:))

title('Figure for $$\Delta t = \frac{(\Delta x)^2}{2}\frac{1}{1.01}$$, within stability threshold', 'interpreter','latex')
xlabel('x','fontsize',14)
ylabel('u(x,t)','fontsize',14)
legend('t = 0.01','t = 0.04','t = 0.09','t = 0.2','fontsize',14)








