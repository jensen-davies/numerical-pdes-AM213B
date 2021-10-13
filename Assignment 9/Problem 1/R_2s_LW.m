function w_sol = R_2s_LW(F,f,L1,L2,N,r)

dx = (L2-L1)/N;
x = L1 + [(0:N+1) - 0.5]*dx;
dt = r*dx;
T = 1.5;
Nt = round(T/dt);
m = numel(x);

w0 = f(x);
w = w0;

for n = 1:Nt %iterate through all time levels to reach time T

    wstar = (w(:,2:m) + w(:,1:m-1))/2 - (0.5*r)*(F(w(:,2:m)) - F(w(:,1:m-1)));
    F_LW = F(wstar);
    
    %FVM update
    w(:,2:m-1) = w(:,2:m-1) - r*(F_LW(:,2:m-1) - F_LW(:,1:m-2)); 
    
    %artificial boundary conditions
    w(:,1) = w(:,2);
    w(:,m) = w(:,m-1);

end
w_sol = w;