clear; close all;

%let w(1) = x, w(2) = y, w(3) = v
a = @(w,t) [sin(w(1))*sin(w(2)) , 1 - exp(sin(w(1) + w(2)))];
b = @(w,t) -cos(w(1))*sin(w(2)) + exp(sin(w(1)+w(2)))*cos(w(1)+w(2));
f = @(w,t) sin(w(1) + w(2))^2;
g = @(w,t) [a(w,t) , b(w,t)*w(3)];



figure(1)
hold on; grid on;

a0_1 = [3.9,2.3];
a0_2 = [2.7,4.0];
a0_3 = [2.0,3.0];
vec = [a0_1;a0_2;a0_3];

h = 0.01;
t0 = 0;

for j = 1:3
    t = [t0:125]*h;
    u_sol = zeros(numel(t),1);
    for i = 1:numel(t);
        u_sol(i) = method_of_characteristics_2D(a,b,g,f,vec(j,:),t0,t(i),h);
    end
    plot(t,u_sol,'linewidth',1);
end

xlabel('t','fontsize',14);
ylabel('u(x_1,y_1,t)','fontsize',14);
legend('(x_1,y_1)=(3.9,2.3)','(x_1,y_1)=(2.7,4.0)','(x_1,y_1)=(2.0,3.0)','fontsize',14,'location','NW')
title('u(x,y,t) vs t for various (x_1,y_1)','fontsize',14)
saveas(gcf,'p5_1','epsc')



