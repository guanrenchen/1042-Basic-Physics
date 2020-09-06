% (a) write down the loop equation in terms of Vc(t), e(t), R and C.
% (b) [Fig.1] R=10.^4, C=10.^-4, e(t)=5.*sin(20.*pi.*t). Plot Vc(t)
% (c) [Fig.2] R=10.^4, C=10.^-4, square wave. Plot Vc(t).
% (d) [Fig.3] R=100, C=10.^-6, triangular wave. Plot VR(t).

% Vc(t) = e(t) - R.*C.*Vc'(t)
% Vc'(t) = (e(t)-Vc(t))./(R.*C)
clc;

% (b) [Fig.1] R=10.^4, C=10.^-4, e(t)=5.*sin(20.*pi.*t). Plot Vc(t)
clear all;
h=10.^-4;
R=10.^4;
C=10.^-4;
t(1) = 0;
v(1) = 0;
e = @(T) 5.*sin(20.*pi.*T);
VdT1 = @(T,V) (e(T)-V)./(R.*C);       
for i=1:5./h
    k1 = h.*VdT1(t(i), v(i));
    k2 = h.*VdT1(t(i)+0.5*h, v(i)+k1./2);
    k3 = h.*VdT1(t(i)+0.5*h, v(i)+k2./2);
    k4 = h.*VdT1(t(i)+h, v(i)+k3);
    t(i+1) = t(i) + h;
    v(i+1) = v(i) + (k1+2.*k2+2.*k3+k4)./6;
end
figure(1)
plot(t,v)
title('Fig.1')
xlabel('seconds')
ylabel('voltage(V)')
axis([0 5 -Inf Inf])

% (c) [Fig.2] R=10.^4, C=10.^-4, square wave. Plot Vc(t).
clear all;
h=10.^-4;
R=10.^4;
C=10.^-4;
t(1) = 0;
v(1) = 0;
VdT1 = @(T,V) (squareWave(T)-V)./(R.*C);       
for i=1:5./h
    k1 = h.*VdT1(t(i), v(i));
    k2 = h.*VdT1(t(i)+0.5*h, v(i)+k1./2);
    k3 = h.*VdT1(t(i)+0.5*h, v(i)+k2./2);
    k4 = h.*VdT1(t(i)+h, v(i)+k3);
    t(i+1) = t(i) + h;
    v(i+1) = v(i) + (k1+2.*k2+2.*k3+k4)./6;
end
figure(2)
plot(t,v)
title('Fig.2')
xlabel('seconds')
ylabel('voltage(V)')
axis([0 5 -Inf Inf])

% (d) [Fig.3] R=100, C=10.^-6, triangular wave. Plot VR(t).
clear all;
h=10.^-4;
R=100;
C=10.^-6;
t(1) = 0;
v(1) = 0;
VR(1) = 0;
VdT1 = @(T,V) (triangularWave(T)-V)./(R.*C);       
for i=1:1./h
    k1 = h.*VdT1(t(i), v(i));
    k2 = h.*VdT1(t(i)+0.5*h, v(i)+k1./2);
    k3 = h.*VdT1(t(i)+0.5*h, v(i)+k2./2);
    k4 = h.*VdT1(t(i)+h, v(i)+k3);
    t(i+1) = t(i) + h;
    v(i+1) = v(i) + (k1+2.*k2+2.*k3+k4)./6;
    
    VR(i+1) = triangularWave(t(i+1)) - v(i+1);
end
figure(3)
plot(t,VR)
title('Fig.3')
xlabel('seconds')
ylabel('voltage(V)')