function [uv,tv] = backward_euler_sys(A,b,t0,u0,dt,N)
m = size(A,1);
uv = zeros(m,N+1);
tv = zeros(N+1,1);
un = u0;
tn = t0;
uv(:,1) = u0;
for n=1:N
    k1 = (eye(m) - dt*A)\(dt*(A*un + b));
    un = un + k1;
    uv(:,n+1) = un;
    tn = tn + dt;
    tv(n+1) = tn;
end


