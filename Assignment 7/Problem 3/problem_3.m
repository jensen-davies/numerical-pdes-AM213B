clc; clear; close all;

a = 1.5;
T = 1.08;
L1 = -0.5; L2 = 2.5;
f = @(x) -cos(pi*x);
g = @(t) sin(a*pi*t);
u_exact = @(x,t)  ((x-a*t) > -0.5).*f(x-a*t) +...
    ((x-a*t) <= -0.5).*g(t - (x+0.5)/a);

N = 300;
dx = 3/N;
r = 0.3;
x = [L1:dx:L2];

u_Upwind_1 = upwind_method(f,g,u_exact,L1,L2,a,dx,0.3,T,N);
u_Upwind_2 = upwind_method(f,g,u_exact,L1,L2,a,dx,0.6,T,N);
u_Lax_F_1 = Lax_F_method(f,g,u_exact,L1,L2,a,dx,0.3,T,N);
u_Lax_F_2 = Lax_F_method(f,g,u_exact,L1,L2,a,dx,0.6,T,N);
u_W_1 = Lax_W_method(f,g,u_exact,L1,L2,a,dx,0.3,T,N);
u_W_2 = Lax_W_method(f,g,u_exact,L1,L2,a,dx,0.6,T,N);

Err_Upwind_1 = abs(u_exact(x,T) - u_Upwind_1);
Err_Upwind_2 = abs(u_exact(x,T) - u_Upwind_2);
Err_Lax_F_1 = abs(u_exact(x,T) - u_Lax_F_1);
Err_Lax_F_2 = abs(u_exact(x,T) - u_Lax_F_2);
Err_W_1 = abs(u_exact(x,T) - u_W_1);
Err_W_2 = abs(u_exact(x,T) - u_W_2);

figure(1)
hold on;
set(gca,'YScale','log');
plot(x,Err_Upwind_1);
plot(x,Err_Lax_F_1);
plot(x,Err_W_1);
title('Error of exact vs Upwind, Lax-Friedrichs, Lax-Wendroff, r = 0.3')
legend('Upwind Error', 'Lax-Friedrichs Error','Lax-Wendroff Error','location','SE','fontsize',14)
xlabel('x', 'fontsize',14)
ylabel('Error', 'fontsize',14)

figure(2)
hold on;
set(gca,'YScale','log');
plot(x,Err_Upwind_2)
plot(x,Err_Lax_F_2)
plot(x,Err_W_2)
title('Error of exact vs Upwind, Lax-Friedrichs, Lax-Wendroff, r = 0.6')
legend('Upwind Error', 'Lax-Friedrichs Error','Lax-Wendroff Error','location','SE','fontsize',14)
xlabel('x', 'fontsize',14)
ylabel('Error', 'fontsize',14)



