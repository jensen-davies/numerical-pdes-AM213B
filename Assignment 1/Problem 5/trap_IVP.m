close all; clc; format long; clear all;

lambda = 1e6;
t0 = 0;
T = 10;
h = 2^(-9);
%h = 0.1;
h_newt = 1e-5;
t = [t0:h:t0+T];
u = zeros(size(t));
tol = 1e-5;
N = numel(t);

f_newt = @(u,u_prev,t,t_prev) u_prev + (h/2)*(fun(u,t,lambda) + fun(u_prev,t_prev,lambda));

u(1) = 0;
iter = 0;

for i = 1:N-1
    u(i+1) = newt_solver(f_newt,u(i+1),u(i),t(i+1), t(i));
end

figure(1)
plot(t,u)
title('Trapezoidal Method Solution, h = 2^{-9}')
xlabel('t')
ylabel('u(t)')

