clc; clear all; close all;

N = 1000;
alpha = 1;
beta = 1;
a = 0;
b = 2;

p_fun = @(x) 0*x;
q_fun = @(x) -625 + 0*x;
r_fun = @(x) -625*x;

[xb, u_sol] = FDM_solver_1(p_fun,q_fun,r_fun,a,b,alpha,beta,N);

figure(1)
hold on; grid on;
p1 = plot(xb,u_sol,'k','linewidth',3.5);
u_exact = xb + ((1+exp(-50))/(1-exp(-100)))*(exp(-25*xb) - exp(25*(xb-2)));
p2 = plot(xb, u_exact, 'g','linewidth',1.5);
title('u(x) vs x and u_{exact}(x) vs x','fontsize',14)
legend([p1,p2],'u(x)', 'u_{exact}(x)','Location','southeast','fontsize',14)
xlabel('x','fontsize',14)

N = 2000;
[xb2, u_sol2] = FDM_solver_1(p_fun,q_fun,r_fun,a,b,alpha,beta,N);

err = zeros(1001,1);
err_exact = zeros(1001,1);

for i = 1:1001
    err(i) = (u_sol(i) - u_sol2(2*i-1))/(1 - 1/4);
    err_exact(i) = u_sol(i) - u_exact(i);
end

figure(2)
hold on; grid on;
p3 = plot(xb, err,'go');
p4 = plot(xb, err_exact,'k','linewidth',1.5);
title('Estimated Error vs x and Exact Error vs x', 'fontsize',12)
legend([p3,p4], 'Estimated error', 'Exact error','fontsize',14)
xlabel('x','fontsize',14);







