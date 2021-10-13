clear all; close all;

x0 = 1;
N = 0;
tol = 1e-5;
h=1e-5;

s = [0:0.1:20];
alpha = 0.9;
beta = 50000;

x_sol = zeros(1,201);

for i = 1:201
    s_temp = s(i);
    err = 1;
    while (err > tol && N < 1e+5)
        N = N+1;
       f_prime = (fun(x0 + h, alpha,beta,s_temp) - fun(x0 - h,alpha,beta,s_temp))/(2*h);
       dx = -fun(x0,alpha,beta,s_temp)/f_prime;
       err = abs(dx);
       x0 = x0 + dx;
    end
    x_sol(i) = x0;
end

hold on; box on;

title('x and cos(s-1)')
xlabel('s')
plot(s,x_sol, ':r','LineWidth',3.3)
plot(s, cos(s-1),'b','LineWidth',1)
legend('x', 'cos(s-1)', 'Location','northeast','Fontsize',12)


