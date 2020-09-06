clear all;
clc;
%(a)(b) : Newton's method
%(c)    : Bisection method
%plots are used to confirm the result and check for other roots

% figure(1)
% x = -5:0.001:5;
% y = (4.*x.^2-exp(x)-exp(-x));
% plot(x, y);
% grid on;
 x = 1;
 for i=1:100
    x = x - (4.*x.^2-exp(x)-exp(-x))./(8.*x-exp(x)+exp(-x));
 end
 fprintf('The smallest positive root of Prob.3(a) is %.20f\n', x);
 x = -1;
 for i=1:100
    x = x - (4.*x.^2-exp(x)-exp(-x))./(8.*x-exp(x)+exp(-x));
 end
 fprintf('The largest negative root of Prob.3(a) is %.20f\n', x);
 
% figure(2)
% x = -5:0.001:5;
% y = (1./2+x./4-x.*sin(x)-cos(2.*x)./2);
% plot(x, y);
% grid on;
x = 1;
for i=1:100
    x = x - (1./2+x./4-x.*sin(x)-cos(2.*x)./2)./(1./4-sin(x)-x.*cos(x)+sin(2.*x));
end
fprintf('The smallest positive root of Prob.3(b) is %.20f\n', x);
x = -3;
for i=1:100
    x = x - (1./2+x./4-x.*sin(x)-cos(2.*x)./2)./(1./4-sin(x)-x.*cos(x)+sin(2.*x));
end
fprintf('The largest negative root of Prob.3(b) is %.20f\n', x);

% figure(3)
% x = -1:0.001:1;
% y = (exp(3.*x)-27.*x.^6+27.*x.^4.*exp(x)-9.*x.^2.*exp(2.*x));
% plot(x, y);
% grid on;
xL = 0;
xR = 1;
f = @(x) exp(3.*x) - 27.*x.^6 + 27.*x.^4.*exp(x) - 9.*x.^2.*exp(2.*x);
for int=1:100
    mid = (xL+xR)/2;
    if(f(xL).*f(mid) < 0)
        xR = mid;
    else
        xL = mid;
    end
end
fprintf('The smallest positive root of Prob.3(c) is %.20f\n', mid);
xL = -4;
xR = 0;
for int=1:100
        mid = (xL+xR)/2;
    if(f(xL).*f(mid) < 0)
        xR = mid;
    else
        xL = mid;
    end
end
fprintf('The largest negative root of Prob.3(c) is %.20f\n', mid);