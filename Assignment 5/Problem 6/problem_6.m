clear; close all;

L = 2;
alpha = 0.4;
p = @(x) (1-0.5*x).^2;
q = @(t) 2*(sin(t)).^2;

N = 200;
T = 3;
dx = L/(N-0.5);
dt = 4*(1e-5);
r = dt/(dx)^2;

x = [((0:N) - 0.5)*dx];
t = [0:dt:T];

u = zeros(4,numel(x)); %solution matrix, comprised of solution vectors
uv = zeros(1,numel(x)); %solution vector

%indices for required time-level solutions
t_ind = [501,12501,25001,75001];

for i = 1:numel(t_ind) %iterate through rows of solution matrix
    uv = p(x);
    for n = 1:t_ind(i)-1
       uv(2:N) = uv(2:N) + r*(uv(1:N-1) - 2*uv(2:N) + uv(3:N+1));
       uv(N+1) = q(t(n)); %right boundary condition
       uv(1) = ((2-alpha*dx)*uv(2))/(2+alpha*dx); %left boundary condition
    end
    u(i,:) = uv; %store solution level in a much smaller matrix
end


figure(1)
hold on; box on; grid on;
plot(x,u(1,:),'linewidth',1.5)
plot(x,u(2,:),'linewidth',1.5)
plot(x,u(3,:),'linewidth',1.5)
plot(x,u(4,:),'linewidth',1.5)
title('u(x,t) vs x','fontsize',14)
legend('t = 0.02','t = 0.5','t = 1','t = 3','fontsize',14,'location','northwest')
xlabel('x','fontsize',14)
ylabel('u(x,t)','fontsize',14)
