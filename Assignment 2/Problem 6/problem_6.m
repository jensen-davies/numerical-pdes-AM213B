clc; clear all; close all;

w0 = [3,0.5];
t0 = 0;
mu = 4;
T = 30;
h = 0.025;
t = [t0:h:t0+T];
N = numel(t)-1;
Err = zeros(N+1,1);

f = @(w,t)  [w(2), mu*(2-exp(w(2)^2))*w(2) - w(1)];
[w_sol5,w_sol4,t_vec,Err_Fehlberg] = Fehlberg45_method(f, w0, t0, h, N);

figure(1)
plot(t_vec, Err_Fehlberg)
set(gca,'YScale','log')
title('Plot of $$E_{n}^{Fehlberg}(h)$$ vs $$t_n$$','interpreter','latex','FontSize',14)
xlabel('$$t_n$$','interpreter','latex','FontSize',14)
ylabel('$$E_{n}^{Fehlberg}(h)$$','interpreter','latex','FontSize',14)

[w_sol5_2n,w_sol4_2n,t_vec_2n,Err_Fehlberg_2n] = Fehlberg45_method(f, w0, t0, h/2, 2*N);
for n = 1:N+1
    Err(n) = norm((1/(1-(0.5)^4))*(w_sol5(n,:) - w_sol5_2n(2*n-1,:)),2);
end

figure(2)
hold on;
box on;
set(gca,'YScale','log')
title('Comparison of $$E_{n}^{Fehlberg}(h)$$ and $$E_n(h)$$','interpreter','latex','FontSize',14)
xlabel('$$t_n$$','interpreter','latex','FontSize',14)
plot(t_vec, Err_Fehlberg)
plot(t_vec, Err)
xlim([-0.5,30])
legend('$$E_{n}^{Fehlberg}(h)$$','$$E_n(h)$$','interpreter','latex','FontSize',14,'Location','southeast')

