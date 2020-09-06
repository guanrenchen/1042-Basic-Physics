clear all
close all
clc

Ms = 2.*10.^30;
Mp = 6.*10.^24;
G = 6.67384.*10.^-11;
r0 = 1.5*10.^11;
Vc = (G.*Ms./r0).^(0.5);
h = 20; %time step
    
for k=1:9
    x(1) = r0;
    y(1) = 0;
    vx(1) = 0;
    vy(1) = 0.1.*(k+1).*Vc; %change initial velocity here
    
    i = 0;
    while(1)
        i = i + 1;
        ADivByR = -G.*Ms./(x(i).^2+y(i).^2).^1.5;
        ax = ADivByR.*x(i);
        ay = ADivByR.*y(i);
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
            period(k) = (2.*i+1).*h;
            SMAxis(k) = abs((x(i)+x(i+1))./2-x(1))./2;
            fprintf('0.%d*Vc :\n',k+1)
            fprintf('period = %d s\n',period(k))
            fprintf('semi-major axis = %E m\n\n',SMAxis(k))
            break
        end
    end
    
    clear x
    clear y
    clear vx
    clear vy
end

plot(SMAxis.^3,period.^2,'b*-')
title('R^3-T^2')
xlabel('R^3(m^3)')
ylabel('T^2(s^2)')