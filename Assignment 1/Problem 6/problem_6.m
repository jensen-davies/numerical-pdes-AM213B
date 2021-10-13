clc; clear all; close all;

t0 = 0;
h = 0.2/128;

T = 2;
t = [t0:h:t0+T];
N = (T/h) + 1;
u = zeros(size(t));
u(1) = 1;
u(2) = exp(-h);

%-----------T=2-------------
%euler method
for n = 2:N-1
    u(n+1) = u(n)*(1-h);
end

hold on;
box on;
figure(1)
plot(t, exp(-t), 'LineWidth',4)
plot(t,u,'LineWidth',2)

%mid-point method
for n = 2:N-1
   u(n+1) =  u(n-1) - 2*h*u(n);
end
plot(t,u,'LineWidth',2)
title('Euler vs Midpoint, T = 2, h = 0.2/128')
legend('Exact','Euler','Midpoint','FontSize', 14)

%---------T=20-------------
T = 20;
t = [t0:h:t0+T];
N = (T/h) + 1;
u = zeros(size(t));
u(1) = 1;
u(2) = exp(-h);

%euler method
for n = 2:N-1
    u(n+1) = u(n)*(1-h);
end

figure(2)
hold on;
box on;
plot(t, exp(-t),'LineWidth',5)
plot(t,u,'LineWidth',2)

%mid-point method
for n = 2:N-1
   u(n+1) =  u(n-1) - h*u(n);
end
plot(t,u,'LineWidth',1);
title('Euler vs Midpoint, T = 20, h = 0.2/128')
legend('Exact','Euler','Midpoint','FontSize', 14)
%-----------------------------


    