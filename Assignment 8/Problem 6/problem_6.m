clear; close all;

%let w(1) = x, w(2) = y, w(3) = v
a = @(w,t) [sin(w(1))*sin(w(2)) , 1 - exp(sin(w(1) + w(2)))];
b = @(w,t) -cos(w(1))*sin(w(2)) + exp(sin(w(1)+w(2)))*cos(w(1)+w(2));
f = @(w,t) sin(w(1) + w(2))^2;
g = @(w,t) [a(w,t) , b(w,t)*w(3)];

N = 80;
dx = 2*pi/N;
dy = 2*pi/N;

x = [0:N]*dx;
y = x;
m = numel(x);

T = [0.0,0.5,1.0,1.25];
h = 0.01;
Nt = round(T/h);
t0 = 0;

U1 = zeros(m,m);
U2 = zeros(m,m);
U3 = zeros(m,m);
U4 = zeros(m,m);

%%
for i = 1:m
    for j = 1:m
        U1(j,i) = method_of_characteristics_2D(a,b,g,f,[x(i),y(j)],t0,T(1),h);
    end
end

%%
for i = 1:m
    for j = 1:m
        U2(j,i) = method_of_characteristics_2D(a,b,g,f,[x(i),y(j)],t0,T(2),h);
    end
end
%%
for i = 1:m
    for j = 1:m
        U3(j,i) = method_of_characteristics_2D(a,b,g,f,[x(i),y(j)],t0,T(3),h);
    end
end
%%
for i = 1:m
    for j = 1:m
        U4(j,i) = method_of_characteristics_2D(a,b,g,f,[x(i),y(j)],t0,T(4),h);
    end
end
%%

figure(1)
hold on; grid on; axis equal
contourf(x,y,U1);
colorbar;
title('u(x,y) for t = 0','fontsize',14)
saveas(gcf,'p6_1','epsc')
xlabel('x','fontsize',14)
ylabel('y','fontsize',14)

figure(2)
hold on; grid on; axis equal
contourf(x,y,U2);
colorbar;
title('u(x,y) for t = 0.5','fontsize',14)
saveas(gcf,'p6_2','epsc')
xlabel('x','fontsize',14)
ylabel('y','fontsize',14)

figure(3)
hold on; grid on; axis equal
contourf(x,y,U3); 
colorbar;
title('u(x,y) for t = 1','fontsize',14)
saveas(gcf,'p6_3','epsc')
xlabel('x','fontsize',14)
ylabel('y','fontsize',14)

figure(4)
hold on; grid on; axis equal
contourf(x,y,U4);
colorbar;
title('u(x,y) for t = 1.25','fontsize',14)
saveas(gcf,'p6_4','epsc')
xlabel('x','fontsize',14)
ylabel('y','fontsize',14)






