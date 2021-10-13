function [xb, u_sol] = FDM_solver_1(p_fun,q_fun,r_fun,a,b,alpha,beta,N)

%Define stepsize, internal grid, and evaluate coefficients along
%internal grid.
h = (b-a)/N;
x = a + [1:N-1]'*h;
p = p_fun(x);
q = q_fun(x);
r = r_fun(x);

%Construct RHS vector g of linear system Au = g
g = r;
g(1) = g(1) - (1/h^2 - p(1)/(2*h))*alpha;
g(N-1) = g(N-1) - (1/h^2 + p(N-1)/(2*h))*beta;

A = diag(-2/h^2 + q(1:N-1),0) + diag(1/h^2 - p(1:N-2)/2*h,-1) +...
    diag(1/h^2 - p(2:N-1)/2*h,1);

u = A\g;

xb = [a; x ; b]; %append on boundary conditions to our grid x
u_sol = [alpha; u ; beta]; %append on the boundary conditions
