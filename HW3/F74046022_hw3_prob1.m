% clear all;
% h=10.^-3;      
% V(1) = 1;      
% C = 2.*10.^-5;
% R = 47000;
% t = 0:h:10;     
% 
% F = @(V) V./(-R.*C);             
% for i=1:10./h
%     k1 = F(V(i));
%     k2 = F(V(i)+0.5.*k1);
%     k3 = F(V(i)+0.5.*k2);
%     k4 = F(V(i)+k3);
%     V(i+1) = V(i) + (h./6).*(k1+2.*k2+2.*k3+k4);
% end
% figure(1)
% plot(t,V)

% m = 1.2.*10.^3 (kg)
% k = 5.8.*10.^4 (N/m)
% damping constant = 4000 (kg/s)
% (1) write down the differential equation of motion.
% (2) [Fig.1] t = 0, compressed 0.1(m), plot the displacement.
% (3) base on (2), find the oscillation frequency.
clear all;
clc;

h = 10.^-3;
t = 0:h:5;
m = 1.2.*10.^3;
k = 5.8.*10.^4;
c = 4.*10.^3;
g = -9.8;

A = @(x,v) g + (-k.*x-c.*v)/m;
x(1) = 0.1;
v(1) = 0;

for i=1:5./h
    v(i+1) = v(i) + A(x(i),v(i)).*h;
    x(i+1) = x(i) + v(i+1).*h + h.^2./2.*A(x(i),v(i));
end
figure(1)
plot(t,x)
title('Fig.1')
xlabel('seconds')
ylabel('displacement(m)')

count = 0;
for i=1:5./h
    if(v(i).*v(i+1)<0)
        count = count + 1;
        if(count==1)
            start = t(i);
        end
        if(count==3)
            finish = t(i);
            break;
        end
    end
end
fprintf('%.3f (1/s)\n',finish-start);