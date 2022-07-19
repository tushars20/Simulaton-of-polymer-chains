dt=0.001;
v=500;
r1x=0;
r1y=0;
r1z=0;
r2x=sqrt(v);
r2y=0;
r2z=0;
time = [];
t=0;
Rend = [];
rms=0;
for i=1:1:10000000
    nx=2*rand-1;
    ny=2*rand-1;
    nz=2*rand-1;

    n_x=2*rand-1;
    n_y=2*rand-1;
    n_z=2*rand-1;

    R = sqrt((r2x-r1x)*(r2x-r1x) + (r2y-r1y)*(r2y-r1y) + (r2z-r1z)*(r2z-r1z));
    rcap = norm(R)/v;

    a = abs(r2x-r1x)/v;
    b = abs(r2y-r1y)/v;
    c = abs(r2z-r1z)/v;
    time(i)=t;
    t=t+0.001;
    rt = (3-rcap*rcap)/(1-rcap*rcap);
    r1x = (sqrt(6/dt)*nx + rt*(r2x-r1x)/v)*dt + r1x;
    r1y = (sqrt(6/dt)*ny + rt*(r2y-r1y)/v)*dt + r1y;
    r1z = (sqrt(6/dt)*nz + rt*(r2z-r1z)/v)*dt + r1z;
    
    r2x = (sqrt(6/dt)*n_x - rt*(r2x-r1x)/v)*dt + r2x;
    r2y = (sqrt(6/dt)*n_y - rt*(r2x-r1x)/v)*dt + r2y;
    r2z = (sqrt(6/dt)*n_z - rt*(r2x-r1x)/v)*dt + r2z;
    Rend(i) = sqrt((r2x-r1x)*(r2x-r1x) + (r2y-r1y)*(r2y-r1y) + (r2z-r1z)*(r2z-r1z));
    rms= rms + Rend(i)*Rend(i);
end 
plot(time,Rend)
rms=sqrt(rms)
















