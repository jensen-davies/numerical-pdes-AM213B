clear; close all; clc;

Lx = 8; Ly = 8;
dx = 0.1; dy = 0.1;
Nx = Lx/dx; Ny = Ly/dy;
x = [0:dx:Lx];
y = [0:dy:Ly];

dt = (1.25)*(1.0e-3);
t_save = [0.1,0.5,1,2];
n_save = round(t_save/dt);
nT = numel(t_save);
%IBVP setup
f =@(x2d,y2d) 0*x2d.*y2d;
gL = @(y,t) -sin(pi*y/8)*tanh(2*t);
gR = @(y,t) -3*sin(pi*y/8)*tanh(2*t);
gB = @(x,t) 0;
gT = @(x,t) x.*(1-x./8)*tanh(2*t);

[x2d,y2d] = meshgrid([0:Nx]*dx, [0:Ny]*dy);
tc = 0;
u2D = zeros(size(x2d,1),size(y2d,1));
u2D = f(x2d,y2d);
u2D(:,1) = gL([0:Ny]'*dy,tc);
u2D(:,Nx+1) = gR([0:Ny]'*dy,tc);
u2D(1,:) = gB([0:Nx]*dx,tc); %'bottom' is top of our matrix
u2D(Ny+1,:) = gT([0:Nx]*dx,tc);

u_sol = zeros(Ny+1,Nx+1,nT+1);
u_sol(:,:,1) = u2D;
ic = 1; %t_ind(ic) is time instance to save the sol

for n = 1:n_save(end)
    %FTCS method (internal points only)
    u2D(2:Ny,2:Nx) = u2D(2:Ny,2:Nx) + ...
    (dt/dx^2)*(u2D(2:Ny,3:Nx+1) - 2*u2D(2:Ny,2:Nx) + u2D(2:Ny,1:Nx-1)) + ...
    (dt/dy^2)*(u2D(3:Ny+1,2:Nx) - 2*u2D(2:Ny,2:Nx) + u2D(1:Ny-1,2:Nx));
  
    %remains to update boundaries
    tc = n*dt; %current (new) time to update BCs to.
    u2D(:,1) = gL([0:Ny]*dy,tc);
    u2D(:,Nx+1) = gR([0:Ny]*dy,tc);
    u2D(1,:) = gB([0:Nx]*dx,tc); %'bottom' is top of our matrix
    u2D(Ny+1,:) = gT([0:Nx]*dx,tc);
    
    if n == n_save(ic)
    ic = ic+1; %next time save index
    u_sol(:,:,ic) = u2D;
    end
end

% figure(1)
% hold on; grid on;
% y_6 = round(6/dy);
% plot(x,u_sol(y_6,:,2))
% plot(x,u_sol(y_6,:,3))
% plot(x,u_sol(y_6,:,4))
% plot(x,u_sol(y_6,:,5))
% title('u(x,y=6,t) vs x','fontsize',14)
% xlabel('x','fontsize',14)
% legend('t=0.1','t=0.5','t=1','t=2','location','SW','fontsize',14)


figure(2)
s1 = surf(x,y,u_sol(:,:,5));
set(s1,'edgecolor','none');
title('u(x,y,t) vs (x,y) at T = 2','fontsize',14)
xlabel('x','fontsize',14)
ylabel('y','fontsize',14)






