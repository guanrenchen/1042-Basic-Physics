% (Finite Riemman Sum / Trapezoid Method / Simpson's Method)
% Find integral, 8 significant digits

% FORMAT :
% (i) xxxxx
% (ii) xxxxx
% (iii) xxxxx

clc;
% (i) (1-x.^2).^(1./2)   0~4
clear all;
h = 10.^-4;
x = 0:h:4;
y = (1-x.^2).^(1./2);
for i=2:2:4./h
    y(i) = y(i).*4;
    y(i+1) = y(i+1).*2;
end
y(i+1) = y(i+1)./2;
fprintf('(i) %.8f\n', h./3.*sum(y));

% (ii) (1+2.*sin(x)).^(-1./2)   0~pi
clear all;
h = 10.^-4;
pi = 3.1416;
x = 0:h:pi;
y = (1+2.*sin(x)).^(-1./2);
for i=2:2:pi./h
    y(i) = y(i).*4;
    y(i+1) = y(i+1).*2;
end
y(i+1) = y(i+1)./2;
fprintf('(ii) %.8f\n', h./3.*sum(y));

% (iii) sin(x)./(1+x.^2)   0~1
clear all;
h = 10.^-3;
x = 0:h:1;
y = sin(x)./(1+x.^2);
for i=2:2:1./h
    y(i) = y(i).*4;
    y(i+1) = y(i+1).*2;
end
y(i+1) = y(i+1)./2;
fprintf('(iii) %.8f\n', h./3.*sum(y));