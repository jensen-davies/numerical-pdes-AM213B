clear; close all;
%define variables & functions that will be passed to methods
L1 = -1; 
L2 = 2;
N = 300;
r = 0.5;

F = @(u) 0.5*(u.^2);
Fp = @(u) u;
f = @(x) (x <= 0)*(-1/2) + (x > 0 & x <=1)*1.0 + (x > 1)*0.0;
alpha = @(u1,u2) 0.5.*(u1 + u2);

T = 1;
u_sol_up1 = upwind1_method(F,Fp,f,alpha,r,T,L1,L2,N);
u_sol_up2 = upwind2_method(F,Fp,f,alpha,r,T,L1,L2,N);
u_sol_LW = LW_method(F,Fp,f,alpha,r,T,L1,L2,N);

%exact solution to Burgers' Equation for t <= 2.
dx = (L2-L1)/N;
x = L1 + [(0:N+1) - 0.5]*dx;
u_ext = @(x,t) (-0.5)*(x <= -0.5*t) +...
(x/t).*((-0.5)*t < x & x <= t) + ...
+ 1.0*(t < x & x <= 1 + 0.5*t) + ...
0.0*(x > 1 + 0.5*t);
    
u_exact = u_ext(x,1);

%part1
figure(1)
hold on; grid on; box on;
plot(x,u_exact,'-o','MarkerIndices',1:7:length(x));
plot(x,u_sol_up1,'linewidth',1.5);
plot(x,u_sol_up2,'linewidth',1.5);
plot(x,u_sol_LW,'linewidth',1.5);

ylabel('u(x,1)','fontsize',12);
xlabel('x','fontsize',12);
title('3 FVMs vs Exact Solution to Burgers Eqn, t = 1','fontsize',12);
legend('Exact','Upwind 1','Upwind 2','Lax Wendroff','fontsize',12,'location','northwest')
saveas(gcf,'p1_1','epsc')

%part2
figure(2)
hold on; grid on;
T = [0,1,1.5,3,6];
h = ['t = 0','t = 1', 't = 1.5', 't = 3', 't = 6'];
for i = 1:numel(T)
    u_sol_up2 = upwind2_method(F,Fp,f,alpha,r,T(i),L1,L2,N);
    plot(x,u_sol_up2,'linewidth',1.5)
end
title('Upwind 2 method at various times','fontsize',14)
legend('t = 0','t = 1', 't = 1.5', 't = 3', 't = 6','fontsize',14,'location','NW')
ylabel('u(x,t)','fontsize',14);
xlabel('x','fontsize',14);
saveas(gcf,'p1_2','epsc')







