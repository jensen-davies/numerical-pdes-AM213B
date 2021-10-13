function [xr, n, flag]=newton_solver(g, x0, tol)
%
% This code finds a solution of g(x) = 0 using Newton's method.
% It requires only evaluations of function g(x).
% The derivative is calculated using numerical differentiation
%
% Input:
%	g: specifies function g(x); note that the parameter values 
%      in function g(x) are already included in the definition of 
%      function g(x). Basically, g(x) is defined as G(x,c)
%	x0: the starting point for Newton's method
%	tol: the error tolerance
%
% Output:
%	xr:  the solution found
%	n:  the number of iterations
%   flag: exit flag, 1=convergence, 0=non-convergence
%
n=0;    % number of iterations completed so far
err=1;
h=1.0e-5; % step size for numerical differentiation
%
while (err>tol) & isfinite(err)
  n=n+1;
  gp=(g(x0+h)-g(x0-h))/(2*h);   % numerical differentiation
  dx=-g(x0)/gp;       % Newton's method
  err=abs(dx);
  x0=x0+dx;
end
%
xr=x0; flag=(err<=tol);
%
%