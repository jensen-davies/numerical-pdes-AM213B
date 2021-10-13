function [uv,tv] = trapezoidal_sys(A,b,t0,u0,dt,N)

m = size(A,1);
uv = zeros(m,N+1);
tv = zeros(N+1,1);
un = u0;
tn = t0;
uv(:,1) = u0;
for n=1:N
    k1 = (dt*(A*un + b));
    k2 = (eye(m) - (0.5)*dt*A)\(dt*(A*(un + 0.5*k1) + b));
    un = un + 0.5*k1 + 0.5*k2;
    uv(:,n+1) = un;
    tn = tn + dt;
    tv(n+1) = tn;
end