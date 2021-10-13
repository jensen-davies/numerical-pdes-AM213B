close all; clc; format long; clear all;

lambda = 1e6;
t0 = 0;
T = 10;
h = 0.1;
h_newt = 1e-5;
t = [t0:h:t0+T];
u = zeros(size(t));
tol = 1e-5;
N = numel(t);

f_newt = @(u,u_prev,t) u_prev + h*fun(u,t,lambda);

u(1) = 0;

for i = 1:N-1
   u(i+1) = newt_solver(f_newt, u(i+1), u(i), t(i+1));
end

figure(1)
plot(t,u,'LineWidth',2)
title('Backward Euler Solution')
xlabel('t')
ylabel('u(t)')