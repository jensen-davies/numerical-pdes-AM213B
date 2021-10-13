clear; close all;

%Code from problem 6 (continuation of IBVP)
L = 2;
alpha = 0.4;
p = @(x) (1-0.5*x).^2;
q = @(t) 2*(sin(t)).^2;
T = 3;
dt = 10^(-5);

[u_100,x_100] = IBVP_hw5p6_solve(p,q,L,T,dt,alpha,100);
[u_200,x_200] = IBVP_hw5p6_solve(p,q,L,T,dt,alpha,200);
[u_400,x_400] = IBVP_hw5p6_solve(p,q,L,T,dt,alpha,400);

xq = [0:0.002:1]*L;

s100 = spline(x_100,u_100,xq);
s200 = spline(x_200,u_200,xq);
s400 = spline(x_400,u_400,xq);

figure(1)
hold on; box on; grid on;
plot(xq,s100-s200, 'linewidth',1.5);
plot(xq,s200-s400, 'linewidth',1.5);
title('Problem 4 figure','fontsize',14)
xlabel('x','fontsize',14)
legend('u_{100} - u_{200}', 'u_{200} - u_{400}', 'fontsize',14,'location','northwest')
