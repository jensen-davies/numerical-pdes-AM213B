clc; clear; close all;

a = 1.5;
T = 1.08;
L1 = -0.5; L2 = 2.5;
f = @(x) cos(pi*x);
g = @(t) sin(a*pi*t);
u_exact = @(x,t)  ((x-a*t) > -0.5).*f(x-a*t) +...
    ((x-a*t) <= -0.5).*g(t - (x+0.5)/a);

N = 300;
dx = 3/N;
r = 0.3;
dt = r*dx;
x = [L1:dx:L2];

u_Upwind = upwind_method(f,g,u_exact,L1,L2,a,dx,0.3,T,N);
u_Lax_F = Lax_F_method(f,g,u_exact,L1,L2,a,dx,0.3,T,N);
u_Lax_W = Lax_W_method(f,g,u_exact,L1,L2,a,dx,0.3,T,N);


Err_Upwind = abs(u_exact(x,T) - u_Upwind);
Err_Lax_F = abs(u_exact(x,T) - u_Lax_F);
Err_Lax_W = abs(u_exact(x,T) - u_Lax_W);


figure(1)
hold on;
plot(x,u_exact(x,T))
plot(x,u_Upwind,'r')
plot(x,u_Lax_F,'k')
plot(x,u_Lax_W,'g')
legend('Exact','Upwind', 'Lax-Friedrichs','Lax-Wendroff','location','south','fontsize',14)
ylabel('u(x,1.08)','fontsize',14)
xlabel('x','fontsize',14)
title('Exact and numerical solutions for t = 1.08 ','fontsize',14)


figure(2)
hold on;
set(gca,'YScale','log');
plot(x,Err_Upwind,'r');
plot(x,Err_Lax_F,'k');
plot(x,Err_Lax_W,'g');
title('Error of exact vs Upwind, Lax-Friedrichs, Lax-Wendroff, r = 0.3')
legend('Upwind Error', 'Lax-Friedrichs Error','Lax-Wendroff Error','location','southeast','fontsize',14)
xlabel('x','fontsize',14)
ylabel('Error','fontsize',14)
