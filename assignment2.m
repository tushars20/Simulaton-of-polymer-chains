dt = 0.001;
x0 = 0;
y0 = 0;
z0 = 0;
x = [0];
y = [0];
z = [0];
t = [0];
x1=0;
y1=0;
z1=0;
t0=0;
j=2;
for i=0.002:dt:100
    nx = 2*rand-1;
    ny = 2*rand-1;
    nz = 2*rand-1;
    x1 = x0 + sqrt(6*dt)*nx;
    y1 = y0 + sqrt(6*dt)*ny;
    z1 = z0 + sqrt(6*dt)*nz;
    x(j) = x1;
    y(j) = y1;
    z(j) = z1;
    t0 = t0 + dt;
    t(j)= t0;
    x0=x1;
    z0=z1;
    y0 =y1;
    j=j+1;
end
msd = [0];
k=1;
n = length(x);
delt = [0];
k=2;
for i=2:1:10000
    msd(i)=0;
    for j=i:1:10000
        msd(i) = msd(i) + (x(j)-x(j-k+1))^2;
    end
    msd(i) = msd(i)/((n-k)*0.001);
    delt(k)=(k-1)*0.001;
    k = k + 1;
end
diffusivity = msd(2)/0.001;
figure(1)
plot(x,y)
title('Y* vs X*')
xlabel('x*')
ylabel('y*')
grid
figure(2)
plot(msd,delt)
title('MSD vs Dt')
xlabel('Dt')
ylabel('MSD')
grid




