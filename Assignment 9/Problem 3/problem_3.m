clc; clear; close all;

[u400,u_exact,x400] = problem_2_module(400);
[u800,~,x800] = problem_2_module(800);

m = numel(x400);
err_exact = u_exact - u400;

s800 = spline(x800,u800,x400);

%how do I calculate the estimated error?
err_est = (s800(1:m) - u400(1:m))/(1-(1/2^2));

figure(1)
hold on; grid on; box on;
plot(x400,err_exact,'-o','linewidth',1,'MarkerIndices',1:9:length(x400));
plot(x400,err_est,'linewidth',1);
title('2s-LW: Exact Error vs x, Estimated Error vs x, t = 0.8','fontsize',12)
legend('Exact Error','Estimated Error','fontsize',12,'location','S')
xlabel('x','fontsize',14)
saveas(gcf,'p3_1','epsc')

