clear all
close all
clc

Ms = 2.*10.^30;
Mp = 6.*10.^24;
G = 6.67384.*10.^-11;
r0 = 1.5*10.^11;
Vc = (G.*Ms./r0).^(0.5);
fprintf('Vc = %f m/s\n',Vc)

x(1) = r0;
y(1) = 0;
vx(1) = 0;
vy(1) = 0.7.*Vc; %change initial velocity here
h = 20; %time step

i = 0;
while(1)
    i = i + 1;
    R = (x(i).^2+y(i).^2).^0.5;
    ax = -G.*Ms./R.^3.*x(i);
    ay = -G.*Ms./R.^3.*y(i);
    x(i+1) = x(i) + h.*vx(i) + h.^2./2.*ax;
    y(i+1) = y(i) + h.*vy(i) + h.^2./2.*ay;
    vx(i+1) = vx(i) + h.*ax;
    vy(i+1) = vy(i) + h.*ay;
    if(vx(i).*vx(i+1)<0 && x(i+1)>0)
        break
    end
end
for i=1:length(x)-1
    if(vx(i).*vx(i+1)<0)
        fprintf('period = %d s\n',(2.*i+1).*h)
        fprintf('semi-major axis = %E m\n',abs((x(i)+x(i+1))./2-x(1))./2)
        break
    end
end
t = 0:h:(length(x)-1).*h;

figure(1),hold on
plot(0,0,'ro')
plot(x(1),y(1),'b.')
title('x-y')
xlabel('(m)')
ylabel('(m)')
legend('sun','planet')
axis([-r0*1.1 r0*1.1 -r0*1.1 r0*1.1])
for i=1:floor(length(t)./100):length(t)
    plot(x(i),y(i),'b.')
    pause(0.05)
end

figure(2)
plot(t,x)
title('x-t')
xlabel('(s)')
ylabel('(m)')
xlim([t(1) t(end)])

figure(3)
plot(t,y)
title('y-t')
xlabel('(s)')
ylabel('(m)')
xlim([t(1) t(end)])