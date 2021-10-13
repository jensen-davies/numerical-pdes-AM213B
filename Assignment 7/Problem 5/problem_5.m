clc; clear; close all;

a = 1.5;
T = 1.08;
L1 = -0.5; L2 = 2.5;
f = @(x) cos(pi*x);
g = @(t) sin(a*pi*t);
u_exact = @(x,t)  ((x-a*t) > -0.5).*f(x-a*t) +...
    ((x-a*t) <= -0.5).*g(t - (x+0.5)/a);

N1 = 300;
N2 = 600;
dx1 = 3/N1;
dx2 = 3/N2;
r = 0.3;
x1 = [L1:dx1:L2];

u_Upwind = upwind_method(f,g,u_exact,L1,L2,a,dx1,0.3,T,N1);
u_Lax_F = Lax_F_method(f,g,u_exact,L1,L2,a,dx1,0.3,T,N1);
u_Lax_W = Lax_W_method(f,g,u_exact,L1,L2,a,dx1,0.3,T,N1);
u_Lax_W_2 = Lax_W_method(f,g,u_exact,L1,L2,a,dx2,0.3,T,600);

Err_Upwind = abs(u_exact(x1,T) - u_Upwind);
Err_Lax_F = abs(u_exact(x1,T) - u_Lax_F);
Err_Lax_W = abs(u_exact(x1,T) - u_Lax_W);

%part 1
figure(1)
hold on;
set(gca,'YScale','log');
plot(x1,Err_Upwind,'r');
plot(x1,Err_Lax_F,'k');
plot(x1,Err_Lax_W,'g');
title('Error of exact vs Upwind, Lax-Friedrichs, Lax-Wendroff, r = 0.3','fontsize',12)
legend('Upwind Error', 'Lax-Friedrichs Error','Lax-Wendroff Error','location','southeast','fontsize',14)
xlabel('x','fontsize',14)
ylabel('Error','fontsize',14)

%part 2
M = size(u_Lax_W,2);
Est_Err = zeros(M,1);

Est_Err = (u_Lax_W(1:M) - u_Lax_W_2(1:2:2*M-1))/(1-(1/2^2));
Est_Err = abs(Est_Err);

figure(2);
hold on;
set(gca,'YScale','log');
plot(x1,Err_Lax_W);
plot(x1,Est_Err);
title('Estimated Error for Lax-Wendroff, r = 0.3','fontsize',14)
legend('Exact Error','Estimated Error','fontsize',14)
xlabel('x','fontsize',14)
ylabel('Error','fontsize',14)


