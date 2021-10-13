function u_sol = upwind_method(f,g,u_exact,L1,L2,a,dx,r,T,N)


dt = r*dx;
Nt = round(T/dt);%number of time levels
x = [L1:dx:L2];
n = size(x,2);
u = zeros(n,1);
u0 = f(x);
u = u0; %initial condition
u(1) = g(0); %boundary condition
for i = 1:Nt
    t = i*dt; %next time step
    t = i*dt; %next time step
    u(2:N+1) = u(2:N+1) - a*r*(u(2:N+1) - u(1:N));
    u(1) = g(t);
end
u_sol = u;