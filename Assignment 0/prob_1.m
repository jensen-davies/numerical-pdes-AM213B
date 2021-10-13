clc; clear all; close all;

x = linspace(0,6.75,28);
f = sin(x) + x/2;
g = cos(x);
h = x.*(2-(x/3)) + 1;

clf
figure(1)
title('Comparison of several functions')
ylabel('f(x)')
xlabel('x')
hold on;
box on;
plot(x,f,'k','LineWidth',1.5)
plot(x,g,'-ob','MarkerFaceColor','r')
plot(x,h,'-sr', 'MarkerFaceColor','y')
legend('sin(x) + x/2','cos(x)','x*(2-x/3)+1', 'Location','northwest','FontSize',14)
ylim([-1.5,6.4])
