clc; clear all; close all;

w0 = [3,0.5];
t0 = 0;
h = 0.025;
mu = [0.5, 2, 4];
T = 30;
t = [t0:h:t0+T];
N = numel(t)-1;


for i = 1:3
    f = @(w,t)  [w(2), mu(i)*(2-exp(w(2)^2))*w(2) - w(1)];
    [w_sol, t_vec] = RK4_method(f, w0, t0, h, N);
    
    y = w_sol(:,1);
    y_prime = w_sol(:,2);
    
        figure(2*i - 1)
        hold on;
        box on;
        plot(t,y);
        plot(t,y_prime);
        title(sprintf('Plot of y(t) vs t and y''(t) vs t for mu = %.1f',mu(i)))
        xlabel('t','FontSize',14)
        legend('y(t)','y''(t)', 'FontSize',16,'Location','northwest')

        figure(2*i)
        hold on;
        box on;
        xlim([-2.3,3.3])
        ylim([-2,3])
        plot(y,y_prime);
        xlabel('y(t)','FontSize',14);
        ylabel('y''(t)','FontSize',14);
        title(sprintf('Plot of y vs y''(t) for mu = %.1f',mu(i)))
    
  
end
