clc; clear; close all;

F = @(w) [w(1,:).*w(2,:)/2 ; (w(1,:).^2 + w(2,:).^2)/4];
w_init = @(x) [2.5 ; 0.25].*(x<=0) + [0.75 ; 0.25].*(x>0);

L1 = -2;
L2 = 2;
N = 400;
r = 0.5;

w = R_2s_LW(F,w_init,L1,L2,N,r);

dx = (L2-L1)/N;
x = L1 + [(0:N+1) - 0.5]*dx;

figure(1)
hold on; box on; grid on;
plot(x,w(1,:),'linewidth',1)
plot(x,w(2,:),'linewidth',1)
title('w_1(x,t) vs x and w_2(x,t) vs x for t = 1.5','fontsize',14)
legend('w_1','w_2','fontsize',14)
xlabel('x','fontsize',14)
saveas(gcf,'p1_1','epsc')