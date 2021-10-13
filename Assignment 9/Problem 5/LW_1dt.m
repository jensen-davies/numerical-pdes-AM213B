function [u2] = LW_1dt(u,a,b,r,dt)

m = numel(u);

ustar = (u(2:m) + u(1:m-1))/2 - (r/2)*(a(2:m).*u(2:m) - a(1:m-1).*u(1:m-1))+...
    (dt/8)*(b(2:m) + b(1:m-1)).*(u(2:m) + u(1:m-1));

%FVM update
u(2:m-1) = u(2:m-1) - (r/2)*( (a(2:m-1)+ a(3:m)).*ustar(2:m-1) - ...
    (a(1:m-2) + a(2:m-1)).*ustar(1:m-2) )  + 0.5*dt*b(2:m-1).*...
    (ustar(2:m-1) + ustar(1:m-2));


%update periodic boundary conditions
u(1) = u(m-1);
u(m) = u(2);

u2 = u;


    