close all;

lambda = 1e6;
t0 = 0;
T = 2^(-10);

for i = 1:5
    
    h(i) = 2^(-17 - i);
    N = T/h(i) + 1;
    t = [t0:h(i):T+t0];
    u = zeros(size(t));
    u(1) = 0;
    for n = 1:N-1
        u(n+1) = u(n) + h(i)*fun(u(n),t(n),lambda);
    end
    
    if (i == 2)
        figure(1)
        plot(t(1:28), u(1:28),'LineWidth',2)
        title('Forward Euler (Blow up with h = 2^{-19})')
        xlabel('t')
        ylabel('u(t)')
    end
    
    %remains bounded for h <= 2^(-20)
    if (i == 5)
        figure(2)
        loglog(t,u,'LineWidth',2)
        title('Forward Euler (h = 2^{-22})')
        xlabel('t')
        ylabel('u(t)')
        ylim([0.15,0.6])
    end
    
end




