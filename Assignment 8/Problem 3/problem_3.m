clear; close all

L1 = 0;
L2 = 4;
N = 400;

dx = (L2-L1)/N;
x = L1 + [(0:N+1) - 0.5]*dx;

F = @(u) (1/4)*(u.^4);
Fp = @(u) u.^3;
f = @(x) sin(pi*x);
alpha = @(u1,u2) (1/4)*((u2.^3) + (u2.^2).*(u1) + (u2).*(u1.^2) + (u1.^3));

r = 0.5;
T = [0,1,3,10,40];

%part 1
figure(1)
hold on; grid on;
for i = 1:numel(T)
    u_sol = upwind2_method(F,Fp,f,alpha,r,T(i),L1,L2,N);
    plot(x,u_sol);
end
legend('t = 0','t = 1','t = 3','t = 10','t = 40','fontsize',14)
title('Plot of u(x,t) vs x for various time levels','fontsize',14)
xlabel('x','fontsize',14)
ylabel('u(x,t)','fontsize',14)
saveas(gcf,'p3_1','epsc')


%part 2
figure(2)
hold on; grid on;
for i = 1:numel(T)
   u_sol = upwind2_method(F,Fp,f,alpha,r,T(i),L1,L2,N);
   u_ratio = u_sol/max(u_sol);
   plot(x, u_ratio);
end
legend('t = 0','t = 1','t = 3','t = 10','t = 40','fontsize',14)
title('Plot of u(x,t)/max(u(x,t)) vs x for various time values','fontsize',12)
xlabel('x','fontsize',14)
saveas(gcf,'p3_2','epsc')
