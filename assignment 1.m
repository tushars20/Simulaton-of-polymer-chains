%  code for analatical
R = 10.^-5; % radius of sphere
p = 1000; %density of liquid
s = 8050; %density of sphere
n = 10.^-3; % cofficient of viscousity
g = 9.8; % accerelation due to gravity
t1 = [0:0.00001: 0.001]; 
u1 = ((2*(s-p)*R*R*g)/(9*n))*(1-exp((-9*n*t1)/(2*s*R*R))); % derived equation for velocity
%plot(t1,u1)
%code for numerical method:
dt = 10.^-4;
t2 = [0:dt:0.001];
u2 = [0];
ui=0;
uf=0;
j=1;
for i= 0: 0.0001 : 0.001
    uf = ui + (((s-p)*g/s) - (9*n*ui)/(2*s*R*R))*dt;
    u2(j) = uf;
    j=j+1;
    ui=uf;
end

u2(1)=0;

plot(t2 , u2 , t1 , u1)
title('U vs T for Analytical & Numerical Method')
xlabel('T')
ylabel('U')




    
    





