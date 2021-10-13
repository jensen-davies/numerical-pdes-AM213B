function u_sol = upwind2_method(F,Fp,f,alpha,r,T,L1,L2,N)

dx = (L2 - L1)/N;
x = L1 + [(0:N+1) - 0.5]*dx;

dt = r*dx;
Nt = round(T/dt);

u0 = f(x);
u = u0;
m = numel(x);

%Upwind method 1 start
for i = 1:Nt
    
    a = alpha(u(1:m-1),u(2:m));
    psi = max([abs(a) ; -Fp(u(1:m-1)) ; Fp(u(2:m))], [], 1);
    du = u(2:m) - u(1:m-1);
    F_Up = 0.5*(F(u(2:m)) + F(u(1:m-1))) - 0.5*psi.*du;
    
    %FVM update
    u(2:m-1) = u(2:m-1) - r.*(F_Up(2:m-1) - F_Up(1:m-2));
    
    %update boundary conditions
    u(1) = u(2);
    u(m) = u(m-1); 
    
end
u_sol = u;
