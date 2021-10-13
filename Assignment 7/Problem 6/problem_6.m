clc; clear; close all;

a = @(x,t) sin(x) + cos(x);
b = @(x,t) -cos(x);
c = @(x,t) 0*x;
f = @(w,t) [a(w(1),t), b(w(1),t)*w(2) + c(w(1),t)];

%need to solve FVP
T = [0.2,0.5,1];
h = 0.005;
x = linspace(0,4*pi,400);
uv = zeros(numel(x),1);
U = zeros(numel(x),3);

for j = 1:numel(T)
    for i = 1:numel(x)
        uv(i) = method_of_characteristics(a,b,c,f,x(i),T(j),h);
    end
    U(:,j) = uv;
end

figure(1)
hold on; grid on; box on;
plot(x,U(:,1));
plot(x,U(:,2));
plot(x,U(:,3));
title('u(x,t) for varying time levels','fontsize',14)
legend('t = 0.2','t = 0.5','t = 1','fontsize',14)
xlabel('x','fontsize',14)
ylabel('u','fontsize',14)


