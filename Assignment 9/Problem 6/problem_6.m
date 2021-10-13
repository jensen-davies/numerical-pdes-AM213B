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

a5 = @(x,y) sin(x).*sin(y);
a4 = @(x,y) 1 - exp(sin(x+y));
f = @(x,y) sin(x+y).^2;

u0 = f(x,y);
u = u0;
ay = a4(x,y);
ax = a5(x,y);
m = size(x,2);

for n = 1:Nt
    %create u^(n,1)
    for j = 1:m
        u1 = u(j,:);
        a = ax(j,:);
        b=0*a;
        u2 = LW_1dt(u1,a,b,r,dt);
        u(j,:) = u2;
    end
    
    for i = 1:m
        u1 = u(:,i)';
        a = ay(:,i)';
        b=0*a;
        u2 = LW_1dt(u1,a,b,r,dt);
        u(:,i) = u2';
    end
end

figure(1)
surf(x,y,u,'edgecolor','none');
xlabel('x','fontsize',14)
ylabel('y','fontsize',14)
title('u vs (x,y) at t = 1.0','fontsize',14)
saveas(gcf,'p6_2','epsc')

figure(2)
contourf(x,y,u);
colorbar;
xlabel('x','fontsize',14)
ylabel('y','fontsize',14)
title('u vs (x,y) at t = 1.0','fontsize',14)
saveas(gcf,'p6_1','epsc')