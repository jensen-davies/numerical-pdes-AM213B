function wv = backward_euler_p6(f,w0,t0,h,Nstep,tol)

wv = zeros(Nstep+1,1);

for n = 1:Nstep
    g=@(x) h*f(w0+x,t0+h) - x;
    x0 = 0; 
    k = newton_solver(g,x0,tol);
    w0 = w0 + k;
    t0 = t0 + h;
    wv(n+1) = w0;
end