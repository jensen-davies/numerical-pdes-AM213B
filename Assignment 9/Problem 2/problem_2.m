clc; clear; close all;

L1 = 0;
L2 = 4*pi;
N = 400;
dx = (L2-L1)/N;
x = [(0:N+1) - 0.5]*dx;

r = 1/pi;
dt = r*dx;
T = 0.8;
Nt = round(T/dt); %integer number of time steps


m = numel(x);
uv = zeros(1,m);

%method of characteristics
a1 = @(x,t) sin(x) + cos(x);
b1 = @(x,t) -cos(x);
g = @(w,t) [a1(w(1),t), b1(w(1),t)*w(2)];
for i = 1:m
    uv(i) = method_of_characteristics(a1,b1,g,x(i),T,dt);
end

%2s-LW method
b = @(x) -sin(x);
a_coeff = a1(x);
b_coeff = b(x);
f = @(x) cos(x).^2;
u0 = f(x);
u = u0;

for n = 1:Nt
    u = LW_1dt(u,a_coeff, b_coeff,r,dt);
end

figure(1)
hold on; grid on; box on;
plot(x,u,'-o','linewidth',1,'MarkerIndices',1:9:length(x));
plot(x,uv,'linewidth',1);
legend('2s-LW', 'M.o.C','fontsize',12,'location','S')
title('2s-LW and method of characteristics solutions vs x, t=0.8','fontsize',12)
xlabel('x','fontsize',14)
saveas(gcf,'p2_1','epsc')

