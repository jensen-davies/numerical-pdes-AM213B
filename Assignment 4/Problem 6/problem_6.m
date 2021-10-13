%Solves prescribed second order linear ODE in problem 6 via FDM
clc; clear all; close all;

N = 1000;
a = 0;
b = 2;
alpha = 1.5;
beta = 0.5;
h = (b-a)/(N-0.5);

p_fun = @(x) 0*x;
q_fun = @(x) -(1+exp(-sin(x)));
r_fun = @(x) -5-sin(x).^2;

[xb,u_sol] = FDM_solver_3(p_fun,q_fun,r_fun,a,b,alpha,beta,N);

figure(1)
grid on;
plot(xb,u_sol,'linewidth',1.5)
title('u(x) vs x','fontsize',14)
xlabel('x','fontsize',14)
ylabel('u(x)','fontsize',14)

f = @(w,t) [w(2), -5 - (sin(t))^2 + (1 + exp(-sin(t)))*w(1)];
w0 = [(2*u_sol(1) + alpha*h)/(2+h), 2*(u_sol(1) - alpha)/(2+h)];
t0 = 0;
[w_sol,t_vec] = RK4_method(f,w0, t0, h, N);

wv = w_sol(:,1);
figure(2)
grid on;
plot(t_vec,wv,'linewidth',1.5)
xlim([0,2])
ylim([0.5,3])
title('RK4 verification of FDM method, u(x) vs x','FontSize',14)
xlabel('x','fontsize',14)
ylabel('u(x)','fontsize',14)