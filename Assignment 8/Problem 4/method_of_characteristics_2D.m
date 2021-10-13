function  [u_sol,tv] = method_of_characteristics_2D(a,b,g,f,a0,t0,T,h)

Nt = round(T/h);
%backtrace
[wv,tv2] = RK4_method(a,a0,T,-h,Nt);

x0 = wv(end,1);
y0 = wv(end,2);
v0 = f([x0,y0]);
w0 = [x0,y0,v0];

%forward evolution
[fv,tv] = RK4_method(g,w0,t0,h,Nt);

u_sol = fv(end,3);