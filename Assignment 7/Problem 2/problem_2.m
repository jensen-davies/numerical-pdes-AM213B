clear; close all;

Lx = 8; Ly = 8;
Nx = 100; Ny = 100;
dx = Lx/(Nx - 0.5);
dy = Ly/Ny;

x = [(0:Nx)-0.5]*dx;
y = [0:Ny]*dy;

%IBVP setup
f = 0;
gL = @(y,t) -2*sin(pi*y/8)*tanh(2*t);
gR = @(y,t) 2*sin(pi*y/8)*tanh(2*t);
gB = @(x,t) -x.*(1-x/8)*tanh(2*t);
gT = @(x,t) -x.*(1-x/8)*tanh(2*t);

u = FTCS_2D_hw7(f,gL,gR,gB,gT,Lx,Ly,dx,dy);

figure(1)
hold on;
y_coord = round(2/dy);
set(gca,'fontsize',14);
plot(x, u(y_coord,:,2));
plot(x, u(y_coord,:,3))
plot(x, u(y_coord,:,4))
plot(x, u(y_coord,:,5))
title('u(x,2) vs x for various times')
legend('t=0.5', 't=5','t=10','t=20','location','northeast')
xlabel('x','fontsize',14)
ylabel('u(x,2)','fontsize',14)

figure(2)
U = u(:,:,5);
surf(x,y,U,'edgecolor','none')
title('u(x,y,20) vs (x,y)','fontsize',14)
xlabel('x','fontsize',14)
ylabel('y','fontsize',14)