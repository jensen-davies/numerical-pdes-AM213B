function [w_sol5, w_sol4, t_vec, Err_Fehlberg] = Fehlberg45_method(f,w0,t0,h,N)
%defining the 4 parameters for this particular Runge-Kutta method

p=6;
A=[0, 0, 0, 0, 0, 0;
   1/4, 0, 0, 0, 0, 0;
   3/32, 9/32, 0, 0, 0, 0;
   1932/2197, -7200/2197, 7296/2197, 0, 0, 0;
   439/216, -8, 3680/513, -845/4104, 0, 0;
   -8/27, 2, -3544/2565, 1859/4104, -11/40, 0];
c=[0,   1/4, 3/8, 12/13,  1,  1/2];

b5=[16/135, 0, 6656/12825, 28561/56430, -9/50, 2/55];  % method of order 5 
b4=[25/216, 0, 1408/2565, 2197/4104, -1/5, 0];   % method of order 4

m = size(w0,2);
k = zeros(p,m);
w_sol4 = zeros(N+1,m);
w_sol5 = zeros(N+1,m);
t_vec = zeros(N+1,1);
Err_Fehlberg = zeros(N+1,1);

w_sol4(1,:) = w0;
w_sol5(1,:) = w0;
t_vec(1) = t0;

for n = 1:N
    %Defining k from general form of explicit Runge-Kutta methods
    for i = 1:p
        k(i,:) =  h*f(w0 + A(i,1:(i-1))*k(1:(i-1),:), t0 + c(i)*h);
    end
    w_sol5(n+1,:) = w0 + b5*k;
    w_sol4(n+1,:) = w0 + b4*k;
    w0 = w0 + b5*k;
    
    t0 = t0 + h;
    t_vec(n+1) = t0;
    
    Err_Fehlberg(n) = norm(w_sol5(n+1,:) - w_sol4(n+1,:))/h;
end