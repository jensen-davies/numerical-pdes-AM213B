clc; clear all; close all;

%defining given parameters
x_start = 0;
x_end = 2;
h = 0.002;
x = [x_start:h:x_end+x_start];
Nstep = numel(x)-1;

b = 0.5;
v = -1;
%first order system of original BVP
f = @(w,x) [w(2), (1 + (0.5)*w(2)^2)*w(1) + sin(x)]; 
w0 = [1,v];

%defining and solving for G(v)
G = @(v) RK4_method_last(f,[1,v],x_start,h,Nstep) - 0.5;
v = newton_solver(G,v,1.0e-12);

%solving the BVP using v from directly above
w0 = [1,v];
[w_sol,x_vec] = RK4_method(f,w0,x_start,h,Nstep);

%plot of numerical solution u(x) vs x
figure(1)
grid on;
plot(x_vec,w_sol(:,1),'linewidth',1.5);
title('u(x) vs x','fontsize',14);
xlabel('x','fontsize',14);
ylabel('u(x)','fontsize',14);

