clear all; close all; clc;
b = 3;
a = 1;
N = zeros(9,1);
h = zeros(9,1);
area_trap = zeros(10,1);
area_simp = zeros(10,1);
error_trap = zeros(9,1);
error_simp = zeros(9,1);
%Compositite Trapezoidal
N = 2;
for i = 1:10
    N = 2*N;
    h(i) = (b-a)/N;
    x_0 = a;
    f_start = fun(a);
    f_end = fun(b);
    sum = 0;
    for j = 1:N-1
        sum = sum + fun(a + j*h(i));
    end
    
    area_trap(i) = (f_start + f_end + 2*sum)*(h(i)/2);

end

%Composite Simpsons
N = 2;
for i = 1:10
    N = 2*N;
    h(i) = (b-a)/N; 
    f_start = fun(a);
    f_end = fun(b);   
    sum_1 = 0;
    sum_2 = 0; 
    
    for j = 1:N-1
        x_j = a + j*h(i);
        sum_1 = sum_1 + fun(x_j);
    end
    
    for j = 1:N
        x_mid = a + (j-1/2)*h(i);
        sum_2 = sum_2 + fun(x_mid);
    end 
    area_simp(i) = (f_start + f_end + 2*sum_1 + 4*sum_2)*(h(i)/6); 
end

%error estimation trap
for i = 1:9
    error_trap(i) = (area_trap(i) - area_trap(i+1))*(4/3);
end

%error estimation simp
for i = 1:9
    error_simp(i) = (area_simp(i) - area_simp(i+1))*(16/15);
end
figure(1)
hold on;
box on;
set(gca,'YScale','log','XScale','log')
title('Error Estimation')
ylabel('Approximate E(h)')
xlabel('h')
loglog(h(1:9), abs(error_trap), '-ob','MarkerFaceColor','r')
loglog(h(1:9), abs(error_simp), '-or', 'MarkerFaceColor', 'g')
legend('Trapezoid error','Simpsons error', 'Location', 'southeast','FontSize', 14)



