function  u_sol = method_of_characteristics(a,b,c,f,xi,T,h)

N = round(T/h);
%backtrace
[wv,tv2] = RK4_method(a,xi,T,-h,N);

x0 = wv(end);
v0 = cos(x0)^2;
w0 = [x0,v0];

%forward evolution
[fv,tv] = RK4_method(f,w0,T,h,N);

u_sol = fv(end,end);