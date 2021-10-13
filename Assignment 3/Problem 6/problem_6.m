clear all; clc; close all;

a = 1 - (1/sqrt(2));
T = 30;
w0 = 0;
t0 = 0;
f=@(u,t) -1*(0.5 + exp(20*cos((1.3)*t)))*sinh(u-cos(t));

for i = 3:8
    w0 = 0;
    t0 = 0;
    h = 1/(2^i);
    t = [t0:h:t0+T]';
    Nstep = numel(t)-1;
    Err_BE = zeros(Nstep+1,1);
    Err_DIRK = zeros(Nstep+1,1);
    
    %2-step DIRK method
    [u_DIRK, t_DIRK] = DIRK_2s_solver(f, t0, w0, h, a, Nstep);
    [u_DIRK_2n, t_DIRK_2n] = DIRK_2s_solver(f, t0, w0, h/2, a, 2*Nstep);

    %backward euler method
    u(1) = 0;
    k = 0;
    tol = 1e-12;
    u_BE =  backward_euler_p6(f,w0,t0,h,Nstep,tol); 
    u_BE_2n =  backward_euler_p6(f,w0,t0,h/2,2*Nstep,tol);
    
    %error estimation for both methods
    for n = 1:Nstep+1
    Err_BE(n) = abs((u_BE(n) - u_BE_2n(2*n - 1))/(1 - (0.5)));
    Err_DIRK(n) = abs((u_DIRK(n) - u_DIRK_2n(2*n - 1))/(1 - (0.5)^2));
    end
    
    %requested plots
    if (i == 5)
        figure(1)
        hold on;
        box on;
        set(gca,'YScale','log')
        plot(t, Err_BE)
        plot(t, Err_DIRK)
        title('Estimated Error for Backward Euler & 2s-DIRK methods, h=2^{-5}')
        legend('EE Backwards Euler', 'EE 2s-DIRK','FontSize',12, 'Location','southeast')
        xlabel('t','FontSize',14)
        xlim([-2,32])
    end
    
    if (i == 7)
        figure(2)
        hold on;
        box on;
        set(gca,'YScale','log')
        plot(t, Err_BE)
        plot(t, Err_DIRK)
        title('Estimated Error for Backward Euler & 2s-DIRK methods, h=2^{-7}')
        legend('EE Backwards Euler', 'EE 2s-DIRK','FontSize',12,'Location','southeast')
        xlabel('t','FontSize',14)
        xlim([-2,32])
    end
    
end

