clc; clear all; close all;

T = 0.2;
dt = 0.01;
dx = dt;
t = [0:dt:T];
x = [0:dx:2];
N = numel(x)-1;
Nstep = numel(t)-1;
gL = 1;
gR = 0;
t0 = 0;

%define MOL stuff
A = (1/dx^2)*(diag(ones(N-2,1),-1) + diag(-2*ones(N-1,1)) + diag(ones(N-2,1),1));
b = zeros(N-1,1);
b(1) = gL/(dx)^2;
b(N-1) = gR/(dx)^2; %redundant but that's ok
u0 = zeros(N-1,1);
u0 = (x(2:N) < 1)';

[usol_1,tsol_1] = backward_euler_sys(A,b,t0,u0,dt,Nstep);
[usol_2,tsol_2] = trapezoidal_sys(A,b,t0,u0,dt,Nstep);
[usol_3,tsol_3] = RK4_MOL(A,b,t0,u0,dt,Nstep);

%adding boundary conditions into solution matrices
usol_1(2:N,:) = usol_1;
usol_1(1,:) = gL;
usol_1(N+1,:)=gR;

usol_2(2:N,:) = usol_2;
usol_2(1,:) = gL;
usol_2(N+1,:) = gR;

usol_3(2:N,:) = usol_3;
usol_3(1,:) = gL;
usol_3(N+1,:) = gR;

figure(1)
hold on; box on; grid on;
plot(x,usol_1(:,2))
plot(x,usol_1(:,5))
plot(x,usol_1(:,10))
plot(x,usol_1(:,21))
title('BTCS Method','fontsize',14)
xlabel('x','fontsize',14)
ylabel('u(x,t)','fontsize',14)
legend('t = 0.01','t = 0.04','t = 0.09','t = 0.2','fontsize',14)


figure(2)
hold on; box on; grid on;
plot(x,usol_2(:,2))
plot(x,usol_2(:,5))
plot(x,usol_2(:,10))
plot(x,usol_2(:,21))
title('Crank Nicolson Method','fontsize',14)
xlabel('x','fontsize',14)
ylabel('u(x,t)','fontsize',14)
legend('t = 0.01','t = 0.04','t = 0.09','t = 0.2','fontsize',14)

figure(3)
hold on; box on; grid on;
plot(x,usol_3(:,2))
plot(x,usol_3(:,5))
plot(x,usol_3(:,10))
plot(x,usol_3(:,21))
title('RK4 MOL','fontsize',14)
xlabel('x','fontsize',14)
ylabel('u(x,t)','fontsize',14)
legend('t = 0.01','t = 0.04','t = 0.09','t = 0.2','fontsize',14)

