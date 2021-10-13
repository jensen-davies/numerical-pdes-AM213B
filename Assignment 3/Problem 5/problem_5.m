clear all; clc; close all;

a = 1 - (1/sqrt(2));
T = 30;
w0 = 0;
t0 = 0;
h = 1/(2^5);
t = [t0:h:t0+T]';
Nstep = numel(t)-1;

f=@(u,t) -1*(0.5 + exp(20*cos((1.3)*t)))*sinh(u-cos(t));

[sol_vec, t_sol] = DIRK_2s_solver(f, t0, w0, h, a, Nstep);

hold on;

%part 1

figure(1)
plot(t, sol_vec)
plot(t, cos(t))
xlim([-2,32])
ylim([-1,1.5])
title('Numerical solution u(t) and cos(t)')
legend('u(t)', 'cos(t)','FontSize',12)
xlabel('t','FontSize',12)

%part 2

figure(2)
set(gca,'YScale','log')
loglog(0.5 + exp(20*cos((1.3)*t(2:numel(t)))), abs(sol_vec(2:numel(sol_vec)) - cos(t(2:numel(t)))), 'o')
%loglog(t,(0.5 + exp(20*cos((1.3)*t))))
%loglog(t, abs(sol_vec - cos(t)))
title('u(t)-cos(t) vs 0.5 + exp(20*cos((1.3)*t))')
xlabel('0.5 + exp(20*cos((1.3)*t))')
ylabel('| (u(t) - cos(t) |')

