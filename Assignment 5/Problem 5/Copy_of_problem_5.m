clc; clear all; close all;

T = 3;
dt = 0.001;
dx = 400*dt;
t = [0:dt:T];
x = [0:dx:2];
N = numel(x)-1;
Nstep = numel(t)-1;
t0 = 0;
%define MOL
A = (1/dx^2)*(diag(ones(N-2,1),-1) + diag(-2*ones(N-1,1)) + diag(ones(N-2,1),1));
b = @(t) [cos(2*t); zeros(N-3,1); sin(2*t)]/(dx)^2;
u0 = 0.5*x(2:N)';

[usol_1,tsol_1] = RK4_MOL(A,b,t0,u0,dt,Nstep);
[usol_2,tsol_2] = RK4_MOL(A,b,t0,u0,dt*0.5,2*Nstep);

%adding boundary conditions to solution
usol_1(2:N,:) = usol_1;
usol_1(1,:) = cos(2*tsol_1)';
usol_1(N+1,:)= sin(2*tsol_1)';

usol_2(2:N,:) = usol_2;
usol_2(1,:) = cos(2*tsol_2)';
usol_2(N+1,:) = sin(2*tsol_2)';

t_ind = [3,51,101,301]; %time indices required for plotting

figure(1)
hold on; box on; grid on;
plot(x, usol_1(:,t_ind(1)))
plot(x, usol_1(:,t_ind(2)))
plot(x, usol_1(:,t_ind(3)))
plot(x, usol_1(:,t_ind(4)))

title('u(x,t) vs x (DIRK-2s MOL)','fontsize',14)
xlabel('x','fontsize',14)
ylabel('u(x,t)','fontsize',14)
legend('t = 0.02','t = 0.5','t = 1','t = 3','fontsize',14,'location','northwest')

err = zeros(N+1,Nstep+1);
p = 2; %assumed order in time

for n=1:Nstep+1
    err(:,n) = (usol_1(:,n) - usol_2(:,2*n-1))/(1-(0.5)^p);
end

figure(2)
hold on;box on; grid on;
plot(x, err(:,t_ind(2)))
plot(x, err(:,t_ind(3)))
plot(x, err(:,t_ind(4)))
title('error vs x (DIRK-2s MOL)','fontsize',14)
xlabel('x','fontsize',14)
ylabel('error','fontsize',14)
legend('t = 0.5','t = 1','t = 3','fontsize',14,'location','southwest')

figure(3)
box on; grid on;
plot(x, err(:,t_ind(1)))
title('error vs x at t = 0.02 (DIRK-2s MOL)','fontsize',14)
xlabel('x','fontsize',14)
ylabel('error','fontsize',14)



