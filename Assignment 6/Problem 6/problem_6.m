clear; close all;

Lx = 8; Ly = 8;
dx = 0.08; dy = 0.08;
Nx = Lx/dx; Ny = Ly/dy;

dt = (1.25)*(1e-3);
t = [dt:dt:20];
t_save = 20;
n_save = round(t_save/dt);
nT = numel(t_save);
%IBVP setup
f = 0;
gL = @(y,t) -sin(pi*y/8)*tanh(2*t);
gR = @(y,t) -3*sin(pi*y/8)*tanh(2*t);
gB = @(x,t) 0;
gT = @(x,t) x.*(1-x./8)*tanh(2*t);

[u1, E1] = FTCS_2D(f,gL,gR,gB,gT,Lx,Ly,dx,dy);
[u2, E2] = FTCS_2D(f,gL,gR,gB,gT,Lx,Ly,0.16,0.16);


figure(1)
hold on;
set(gca,'YScale','log','fontsize',14)
plot(t,E1)
title('E(t) vs t')
xlabel('t')
ylabel('E(t)')

figure(2)
hold on;
x = [0:2*dx:Lx];
y = [0:2*dy:Ly];
U = u2(:,:,2) - u1(1:2:Ny+1,1:2:Nx+1, 2);
surf(x,y,U,'edgecolor','none')
title('$u_{\{\Delta = 0.16 \}} - u_{\{\Delta = 0.08\}}$ at T = 20.','interpreter','latex','fontsize',14)
xlabel('x','fontsize',14)
ylabel('y','fontsize',14)


