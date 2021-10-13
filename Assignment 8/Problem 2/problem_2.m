clear; close all;

L1 = -1;
L2 = 2;
N = 300;


F = @(u) 0.5*(u.^2);
Fp = @(u) u;
f = @(x) (x <= 0)*(-1/2) + (x > 0 & x <=1)*1.0 + (x > 1)*0.0;
alpha = @(u1,u2) 0.5.*(u1 + u2);
u_ext = @(x,t) (-0.5)*(x <= -0.5*t) +...
(x/t).*((-0.5)*t < x & x <= t) + ...
+ 1.0*(t < x & x <= 1 + 0.5*t) + ...
0.0*(x > 1 + 0.5*t);

%define grid x in driver program to plot
dx = (L2-L1)/N; 
x = L1 + [(0:N+1) - 0.5]*dx;

%part 1
u1 = upwind2_method(F,Fp,f,alpha,10/8,0.5,L1,L2,N);

figure(1)
hold on; grid on; box on;
plot(x,u1);
title('Upwind 2 with CFL violation, r = 10/8, t = 0.5','fontsize',12)
xlabel('x','fontsize',14)
ylabel('u(x,0.5)','fontsize',14)
xlim([-1.1,2.1]) %an attempt at making the huge oscillation more readable
saveas(gcf,'p2_1','epsc')

%part2
u2 = upwind2_method(F,Fp,f,alpha,10/8.5,1.6,L1,L2,N);
u_exact = u_ext(x,1.6);

figure(2)
hold on; grid on; box on;
plot(x,u2,'linewidth',1);
plot(x,u_exact,'linewidth',1);
title('Upwind 2 with CFL violation, r = 10/8.5, t = 1.6','fontsize',12)
xlabel('x','fontsize',14)
ylabel('u(x,1.6)','fontsize',14)
legend('Numerical solution','Exact Solution','location','northwest','fontsize',14)
saveas(gcf,'p2_2','epsc')