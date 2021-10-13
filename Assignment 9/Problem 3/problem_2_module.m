function [u,uv,x] = problem_2_module(N);

L1 = 0;
L2 = 4*pi;
dx = (L2-L1)/N;
x = [(0:N+1) - 0.5]*dx;

r = 1/pi;
dt = r*dx;
T = 0.8;
Nt = round(T/dt); %integer number of time steps


m = numel(x);
uv = zeros(1,m);

%method of characteristics
a1 = @(x,t) sin(x) + cos(x);
b1 = @(x,t) -cos(x);
g = @(w,t) [a1(w(1),t), b1(w(1),t)*w(2)];
for i = 1:m
    uv(i) = method_of_characteristics(a1,b1,g,x(i),T,dt);
end

%2s-LW method
b = @(x) -sin(x);
a_coeff = a1(x);
b_coeff = b(x);
f = @(x) cos(x).^2;
u0 = f(x);
u = u0;

for n = 1:Nt
    u = LW_1dt(u,a_coeff, b_coeff,r,dt);
end