clc; clear all; close all;

w0 = [3,0.5];
t0 = 0;
mu = 4;
T = 30;

k = 8;
Err_max = zeros(k,1);
H = zeros(k,1);

for i = 1:k
    H(i) = 1/(2^(i+2));
    h = H(i);
    t = [t0:h:t0+T];
    N = numel(t)-1;
    Err = zeros(N+1,1);
    f = @(w,t)  [w(2), mu*(2-exp(w(2)^2))*w(2) - w(1)];
    [w_sol, t_vec] = RK4_method(f, w0, t0, h, N);
    [w_sol_2n, t_vec_2n] = RK4_method(f,w0,t0,h/2,2*N);
    
    for n = 1:N+1
        Err(n) = norm((1/(1-(0.5)^4))*(w_sol(n,:) - w_sol_2n(2*n-1,:)),2);
    end
    
    Err_max(i) = max(Err(~isinf(Err)));
    
    if (i == 6)
        figure(1)
        hold on;
        plot(t_vec,Err)
        xlabel('$$t$$','interpreter','latex','FontSize',14)
        ylabel('$$\|E_n(h)\|$$','interpreter','latex','FontSize',14)
        xlim([-1,30])
    end
    if (i == 7)
        plot(t_vec,Err)
        set(gca,'YScale','log')
        title('Plot of $$\|E_{n}(h)\|$$ vs $$t_n$$','interpreter','latex')
        legend('Step size $$h_c$$','Step size $$h_c/2$$','interpreter','latex','FontSize',16)
    end
    
end

figure(2)
loglog(H,Err_max)
title('Plot of maximum error vs t')
xlabel('$$h$$','interpreter','latex','FontSize',14)
ylabel('$$E_{max}(h)$$','interpreter','latex','FontSize',14)