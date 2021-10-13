clear; close all;

x = 1.45;
h = 10.^(-[1:0.2:14]);

q1 = @(h) (sin(x+h) - sin(x))./h;
q2 = @(h) (sin(x+h) - sin(x-h))./(2.*h);
%exact derivative is cos(x)

E1 = zeros(numel(h),1);
E2 = zeros(numel(h),1);

E1 = abs(q1(h) - cos(x));
E2 = abs(q2(h) - cos(x));

figure(1)
hold on;
set(gca,'YScale','log', 'XScale','log')
loglog(h,E1);
loglog(h,E2);
xlabel('h','fontsize',14)
ylabel('Error','fontsize',14)
title('Numerical differentiaion error (log-scale)','fontsize',14)
legend('1st Order','2nd Order','fontsize',14,'location', 'southwest')
