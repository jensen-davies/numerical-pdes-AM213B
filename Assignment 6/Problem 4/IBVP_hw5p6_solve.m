function [u,x] = IBVP_hw5p6_solve(p,q,L,T,dt,alpha,N)

dx = L/(N-0.5);
r = dt/(dx)^2;

x = [((0:N) - 0.5)*dx];
t = [0:dt:T];

uv = zeros(numel(x),1);
uv = p(x);

for n = 1:numel(t)-1
   uv(2:N) = uv(2:N) + r*(uv(1:N-1) - 2*uv(2:N) + uv(3:N+1));
   uv(N+1) = q(t(n)); %right boundary condition
   uv(1) = ((2-alpha*dx)*uv(2))/(2+alpha*dx); %left boundary condition
end

u = uv; %store solution at T = 3

