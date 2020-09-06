% L=2.*10.^-3;  
% R=8;
% C=5.*10.^-6;
% (a) Vs(t) = L.*I'(t) + R.*I(t) + Q./C
%     Vs'(t) = L.*I"(t) + R.*I'(t) + 1./C.*I(t).
% 
% (b)(c)(d)Plot VR(t), VS(t) on the same figure, 0<=t<=10 (ms)
% (b) [Fig.1] VS(t) = cos(6000.*t)
% (c) [Fig.2] VS(t) = cos(10000.*t)
% (d) [Fig.3] VS(t) = cos(20000.*t)
clear all;
clc;
L=2.*10.^-3;
R=8;
C=5.*10.^-6;

h = 10.^-6;
t=0:h:0.01;
Idt0(1)= 0;
Idt1(1)= 1./L;

% (b) Vs(t) = cos(6000.*t)
VS = @(T) cos(6000.*T);
VSdT1 = @(T) -6000.*sin(6000.*T);
IdT2 = @(T,dT0,dT1) (VSdT1(T)-R.*dT1-dT0./C)./L;
for i=1:0.01./h
    Idt1(i+1) = Idt1(i) + h.*IdT2(t(i),Idt0(i),Idt1(i));
    Idt0(i+1) = Idt0(i) + h.*Idt1(i);
end
figure(1)
plot(t.*1000,VS(t),t.*1000,R.*Idt0)
title('Fig. 1')
xlabel('miliseconds')
ylabel('voltage(V)')
axis([0 10 -1.1 1.1])

% (c) Vs(t) = cos(10000.*t)
VS = @(T) cos(10000.*T);
VSdT1 = @(T) -10000.*sin(10000.*T);
IdT2 = @(T,dT0,dT1) (VSdT1(T)-R.*dT1-dT0./C)./L;
for i=1:0.01./h
    Idt1(i+1) = Idt1(i) + h.*IdT2(t(i),Idt0(i),Idt1(i));
    Idt0(i+1) = Idt0(i) + h.*Idt1(i);
end
figure(2)
plot(t.*1000,VS(t),t.*1000,R.*Idt0)
title('Fig. 2')
xlabel('miliseconds')
ylabel('voltage(V)')
axis([0 10 -1.1 1.1])


% (d) Vs(t) = cos(20000.*t)
VS = @(T) cos(20000.*T);
VSdT1 = @(T) -20000.*sin(20000.*T);
IdT2 = @(T,dT0,dT1) (VSdT1(T)-R.*dT1-dT0./C)./L;
for i=1:0.01./h
    Idt1(i+1) = Idt1(i) + h.*IdT2(t(i),Idt0(i),Idt1(i));
    Idt0(i+1) = Idt0(i) + h.*Idt1(i);
end
figure(3)
plot(t.*1000,VS(t),t.*1000,R.*Idt0)
title('Fig. 3')
xlabel('miliseconds')
ylabel('voltage(V)')
axis([0 10 -1.1 1.1])