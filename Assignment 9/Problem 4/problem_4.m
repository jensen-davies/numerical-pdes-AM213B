clc; clear; close all;

L1 = 0;
L2 = 2*pi;
N = 200;
T = 1.0;
dx = (L2-L1)/N;
x1 = L1 + [(0:N+1) - 0.5]*dx;
dy = dx;
y1 = x1;
r = 1/pi;
dt = r*dx;
Nt = round(T/dt);

[x,y] = meshgrid(x1,y1);

a = @(x,y) sin(x).*sin(y);
f = @(x,y) sin(x+y).^2;

u0 = f(x,y);
u = u0;
ax = a(x,y);
m = size(x,2);

for i = 1:Nt
    for j = 1:m
        u1 = u(j,:);
        a = ax(j,:);
        b=0*a;
        u2 = LW_1dt(u1,a,b,r,dt);
        u(j,:) = u2;
    end
end

figure(1)
contourf(x,y,u);
colorbar
title('u vs (x,y) at t = 1.0','fontsize',14)
xlabel('x','fontsize',14)
ylabel('y','fontsize',14)
saveas(gcf,'p4_1','epsc')


figure(2)
surf(x,y,u,'edgecolor','none');
xlabel('x','fontsize',14)
ylabel('y','fontsize',14)
title('u vs (x,y) at t = 1.0','fontsize',14)
saveas(gcf,'p4_2','epsc')