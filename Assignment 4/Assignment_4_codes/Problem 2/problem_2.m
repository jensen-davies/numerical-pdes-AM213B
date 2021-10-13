 clc; clear all; close all;
 
 n = 256; %used in example code
 b = 1.05;
 theta = [0:n]/n*2*pi;
 xi = exp(sqrt(-1)*theta);
 
 %Plot for 3-step Adams-Moulton method
 rho_1 = @(xi) xi.^3 - xi.^2;
 sigma_1 = @(xi) (3/8).*(xi).^3 + (19/24).*(xi).^2 - (5/24).*(xi) + (1/24);
 
 figure(1)
 hold on; grid on;
 xlim([-4,2]);
 ylim([-3,3]);
 
 z1 = rho_1(xi)./sigma_1(xi);
 x1 = real(z1);
 y1 = imag(z1);
 
 z1_b = rho_1(b*xi)./sigma_1(b*xi);
 x1_b = real(z1_b);
 y1_b = imag(z1_b);
 
 fill(x1,y1,0.75*[1,1,1])
 
 h1 = plot(x1,y1, 'b-', 'linewidth',1.5);
 h1_b = plot(x1_b, y1_b, 'r--','linewidth',1.5);
 
 plot([0,0], [-3,3],'-k','linewidth',1);
 
 title('3-step Adams-Moulton method')
 xlabel('Re(z)')
 ylabel('Im(z)')
 legend('S','b = 1.0', 'b = 1.05', 'location','northwest','fontsize',14)
 
 %Plot for LMM from assignment 3
 figure (2)
 rho_2 = @(xi) xi.^2 - 1;
 sigma_2 = @(xi) (1/3).*(xi).^2 + (4/3).*(xi) + (1/3);
 hold on; grid on;
 xlim([-1,1]);
 ylim([-2,2]);
 
 z2 = rho_2(xi)./sigma_2(xi);
 x2 = real(z2);
 y2 = imag(z2);
 
 z2_b = rho_2(b*xi)./sigma_2(b*xi);
 x2_b = real(z2_b);
 y2_b = imag(z2_b);
 
 h2 = plot(x2,y2, 'b-', 'linewidth',1.5);
 h2_b = plot(x2_b, y2_b, 'r--', 'linewidth',1.5);

 title('2-step 4th order LMM')
 xlabel('Re(z)')
 ylabel('Im(z)')
 legend('b = 1.0', 'b = 1.05', 'location','northwest','fontsize',14)
 
 %Plot for BDF 2
 figure(3)
 rho_3 = @(xi) (3/2).*(xi).^2 - 2.*xi + (1/2);
 sigma_3 = @(xi) xi.^2;
 hold on; grid on;
 xlim([-1,5]);
 ylim([-3,3]); 
 
 z3 = rho_3(xi)./sigma_3(xi);
 x3 = real(z3);
 y3 = imag(z3);
 
 z3_b = rho_3(b*xi)./sigma_3(b*xi);
 x3_b = real(z3_b);
 y3_b = imag(z3_b);
 
 bdf_fill = fill([-1,-1,5,5], [-3,3,3,-3], 0.75*[1,1,1]);
 fill(x3,y3,[1,1,1]);
 h3 = plot(x3,y3, 'b-', 'linewidth',1.5);
 h3_b = plot(x3_b, y3_b, 'r--', 'linewidth',1.5);
 
 plot([0,0], [-3,3],'-k','linewidth',1);
 
 title('BDF2 method')
 xlabel('Re(z)')
 ylabel('Im(z)')
 legend([h3,h3_b,bdf_fill],'b = 1.0', 'b = 1.05', 'S', 'location','northeast','fontsize',14)
 
 %Plot for BDF 3
 figure(4)
 rho_4 =@(xi) (11/6).*(xi).^3 - 3.*(xi).^2 + (3/2).*(xi) - (1/3);
 sigma_4 = @(xi) xi.^3;
 hold on; grid on;
 xlim([-2,7]);
 ylim([-5,5]);
 
 z4 = rho_4(xi)./sigma_4(xi);
 x4 = real(z4);
 y4 = imag(z4);
 
 z4_b = rho_4(b*xi)./sigma_4(b*xi);
 x4_b = real(z4_b);
 y4_b = imag(z4_b);
 
 bdf_fill = fill([-2,-2,7,7],[-5,5,5,-5],0.75*[1,1,1]);
 fill(x4,y4,[1,1,1]);
 h4 = plot(x4,y4, 'b-', 'linewidth',1.5);
 h4_b = plot(x4_b, y4_b, 'r--', 'linewidth',1.5);
 
 plot([0,0], [-5,5],'-k','linewidth',1);
 
 title('BDF3 method')
 xlabel('Re(z)')
 ylabel('Im(z)')
 legend([h4,h4_b,bdf_fill],'b = 1.0', 'b = 1.05','S', 'location','northeast','fontsize',14)
