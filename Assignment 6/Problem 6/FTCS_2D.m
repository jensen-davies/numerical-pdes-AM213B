function [u_sol,E] = FTCS_2D(f,gL,gR,gB,gT,Lx,Ly,dx,dy)

Nx = Lx/dx; Ny = Ly/dy;

dt = (1.25)*(1.0e-3);
t = [dt:dt:20];
t_save = 20;
n_save = round(t_save/dt);
nT = numel(t_save);
%IBVP setup

[x2,y2] = meshgrid([0:Nx]*dx, [0:Ny]*dy);
tc = 0;
u2D = zeros(size(x2,1),size(y2,1));
u2D(:,1) = gL([0:Ny]'*dy,tc);
u2D(:,Nx+1) = gR([0:Ny]'*dy,tc);
u2D(1,:) = gB([0:Nx]*dx,tc); %'bottom' is top of our matrix
u2D(Ny+1,:) = gT([0:Nx]*dx,tc);

u_sol = zeros(Ny+1,Nx+1,nT+1);
u_sol(:,:,1) = u2D;
ic = 1; %t_ind(ic) is time instance to save the sol
E = zeros(numel(t),1);

for n = 1:n_save(end)
    
    u2D_prev = u2D;
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
    
    E(n) = max(abs(u2D(2:Ny,2:Nx) - u2D_prev(2:Ny,2:Nx)),[],'all')/dt;
    
    if n == n_save(ic)
    ic = ic+1; %next time save index
    u_sol(:,:,ic) = u2D;
    end
end