function [wv,tv]=DIRK_2s_solver(f,t0,w0,h,a,Nstep)
%This code implements the 2-stage DIRK method to solve a scalar ODE.
%We are modifying the provided DIRK_solver.m which solves the 3-stage DIRK
%method.
p=2;
A= [a, 0 ;
    1-a, a];
% Matrix A of a DIRK method is lower triangular!!!
c=[a,1];
b=[1-a,a];
%
k=zeros(p,1);
wv=zeros(Nstep+1,1); wv(1,:)=w0;
tv=zeros(Nstep+1,1); tv(1)=t0;
%
for n=1:Nstep
  for i=1:p % solve ki sequentially at each stage
    % The equation for ki comes from the DIRK method
    G=@(x) h*f(w0+A(i,1:(i-1))*k(1:(i-1))+A(i,i)*x, t0+c(i)*h)-x; 
    % Solve the equation using Newton's method
    tol=1e-12; x0=0;
    [xr, n_iter, flag]=newton_solver(G, x0, tol);
    if flag==0
      disp([t0, w0, xr, n_iter, flag])
    end
    k(i)=xr;
  end
  w0=w0+b*k;
  t0=t0+h;
  wv(n+1)=w0;
  tv(n+1)=t0;
end
%
%