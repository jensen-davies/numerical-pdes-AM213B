function z = newt_solver(f,x0,c,t,t_prev)

tol = 1e-5;
err = 1;
dx = 0;
h = 1e-5;

while (err > tol)
    f_prime = (f(x0 + h,c,t,t_prev) - f(x0 - h,c,t,t_prev))/(2*h);
    dx = -f(x0,c,t,t_prev)/f_prime;
    err = abs(dx);
    x0 = x0 + dx;
end

z = x0;
end
    
