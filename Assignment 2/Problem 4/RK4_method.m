function [w_sol, t_vec] = RK4_method(f,w0,t0,h,N)

%defining the 4 parameters for this particular Runge-Kutta method
p=4;
A=[0,   0,   0,   0  ; 1/2, 0,   0,   0  ; 0,   1/2, 0,   0  ; 0,   0,   1,   0  ];
c=[0,   1/2, 1/2, 1  ];
b=[1/6, 1/3, 1/3, 1/6];

m = size(w0,2);
k = zeros(p,m);
w_sol = zeros(N+1,m);
t_vec = zeros(N+1,1);

w_sol(1,:) = w0;
t_vec(1) = t0;

for n = 1:N
    %Defining k from general form of explicit Runge-Kutta methods
    for i = 1:p
        k(i,:) =  h*f(w0 + A(i,1:(i-1))*k(1:(i-1),:), t0 + c(i)*h);
    end
    w0 = w0 + b*k;
    w_sol(n+1,:) =  w0;
    t0 = t0 + h;
    t_vec(n+1) = t0;
end