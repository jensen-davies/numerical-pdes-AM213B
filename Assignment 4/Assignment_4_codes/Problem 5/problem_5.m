%Solves prescribed second order linear ODE in problem 5 via FDM
clc; clear all; close all;

N = 1000;
a = 0;
b = 2;
alpha = 2.5;
beta = 0.5;

p_fun = @(x) 0*x;
q_fun = @(x) -(1+exp(-sin(x)));
r_fun = @(x) -5-sin(x).^2;

[xb,u_sol] = FDM_solver_2(p_fun,q_fun,r_fun,a,b,alpha,beta,N);

figure(1)
grid on;
plot(xb,u_sol,'linewidth',1.5)
title('u(x) vs x','fontsize',14)
xlabel('x','fontsize',14)
ylabel('u(x)','fontsize',14)