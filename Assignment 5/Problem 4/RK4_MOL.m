function [uv,tv] = RK4_MOL(A,b,t0,u0,dt,Nstep)

m = size(A,1);

uv = zeros(m,Nstep+1); uv(:,1) = u0;
tv = zeros(Nstep+1,1); tv(1) = t0;

un = u0;
tn = t0;

for n = 1:Nstep
    k1 = dt*A*un + dt*b; 
    k2 = dt*A*(un + (1/2)*k1) + dt*b;
    k3 = dt*A*(un + (1/2)*k2) + dt*b;
    k4 = dt*A*(un + k3) + dt*b;
    tn = tn+dt;
    un = un + (1/6)*k1 + (1/3)*k2 + (1/3)*k3 + (1/6)*k4;
    uv(:,n+1) = un;
    tv(n+1) = tn;
end
