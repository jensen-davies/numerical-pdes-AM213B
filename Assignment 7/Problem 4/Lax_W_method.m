function u_sol = Lax_W_method(f,g,u_exact,L1,L2,a,dx,r,T,N)


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
    u(2:N) = u(2:N) - 0.5*(a*r)*(u(3:N+1) - u(1:N-1)) +...
        0.5*(a*r)^2*(u(3:N+1) - 2*u(2:N) + u(1:N-1));
    u(1) = g(t);
    u(N+1) = 2*u(N) - u(N-1);
end
u_sol = u;