clc; close all; clear all;

figure(1)

xLower = -3;
xUpper = 12;
yLower = -8;
yUpper = 8;
%resolution
n = 200;

%define axes along our x,y limits
x1d = xLower + (xUpper - xLower)*[0:n]/n;
y1d = yLower + (yUpper - yLower)*[0:n]/n;

%construct grid
[x2d,y2d] = meshgrid(x1d,y1d);

%define z
z = x2d + sqrt(-1)*y2d;

%define functions to plot contours of
phi_heun = abs(z.^2./2 + z + 1);
phi_RK4 = abs((z.^4)./24 + (z.^3)./6 + (z.^2)./2 + z + 1);
a = 1 - (1/sqrt(2));
phi_DIRK_1 = abs((1 + (1 - 2*a).*z)./(1-a.*z).^2);
a = 0.5;
phi_DIRK_2 = abs((1 + (1 - 2*a).*z)./(1-a.*z).^2);
levels = [1,1];
hold on; grid on; box on;
set(gca,'fontsize',16)
[~,h1] = contour(x2d,y2d,phi_heun,[1,1], 'k-','linewidth',1.5);
[~,h2] = contour(x2d,y2d,phi_RK4 ,[1,1],'b-','linewidth',1.5);
[~,h3] = contour(x2d,y2d,phi_DIRK_1,[1,1],'r-','linewidth',1.5);
[~,h4] = contour(x2d,y2d,phi_DIRK_2,[1,1],'g-','linewidth',1.5);
axis([xLower,xUpper,yLower,yUpper])
xlabel('x')
ylabel('y')
legend('Heun''s method', 'RK4 method', '2s-DIRK, a = 1-1/sqrt(2)', '2s-DIRK, a = 0.5')
title('Contours at value 1 for Heun''s/RK4/2s-DIRK methods','FontSize',12)