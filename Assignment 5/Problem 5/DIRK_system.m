function [uv,tv] = DIRK_system(A,b,t0,u0,dt,Nstep)

alpha = 1-1/sqrt(2);
m = size(A,1);

uv = zeros(m,Nstep+1); uv(:,1) = u0;
tv = zeros(Nstep+1,1); tv(1) = t0;

un = u0;
tn = t0;

Ah = (eye(m) - dt*alpha*A);
for n = 1:Nstep
    k1 = Ah\(dt*A*un + dt*b(tn+alpha*dt));
    k2 = Ah\(dt*A*(un + (1 - alpha)*k1) + dt*b(tn + dt));
    tn = tn+dt;
    un = un + (1 - alpha)*k1 + alpha*k2;
    uv(:,n+1) = un;
    tv(n+1) = tn;
end
