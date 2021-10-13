clc; clear all; close all;

h = 2.^(-[0:0.5:10]);
x = 1;
err_1 = abs( (sin(x+h) - sin(x))./h - cos(x) );
err_2 = abs( (sin(x+h) - sin(x-h))./(2*h) - cos(x) );

figure(1)
hold on;
box on;
ylabel('e(h)')
xlabel('h')
title('Error of numerical differentiation')
set(gca,'YScale','log','XScale','log')
loglog(h, err_1, '-ob','MarkerFaceColor','r')
loglog(h, err_2, '-sr', 'MarkerFaceColor', 'y')
xlim([5*1e-4,1])
ylim([5*1e-8,1])
%plot(log(h), log(err_1), '-ob','MarkerFaceColor','r')
%plot(log(h), log(err_2), '-sr', 'MarkerFaceColor', 'y')
legend('First order method','Second order method', 'Location', 'southeast','FontSize', 14)