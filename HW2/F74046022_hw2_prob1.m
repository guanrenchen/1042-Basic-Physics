% mass : 5(kg)
% v(t) = -20.*exp(-0.01.*t.^2).*sin(20.*pi.*t+2./5.*pi)   t>=0

% FORMAT :
% (c) F(8) = ________N
% (d) x(10) = ________m
% (e) The total travel length from t = 0 to 10 is _________ m
clear all;
clc;

m = 5;
t = 0:0.001:30;

% (a) v-t plot
figure(1)
v = -20.*exp(-0.01.*t.^2).*sin(pi.*(20.*t+2./5));
plot(t,v)
xlabel('time(second)');
ylabel('speed(m/s)');

% (b) F-t plot
% Central Difference
figure(2)
h = 10.^-4;
posh = -20.*exp(-0.01.*(t+h).^2).*sin(20.*pi.*(t+h)+2./5.*pi);
negh = -20.*exp(-0.01.*(t-h).^2).*sin(20.*pi.*(t-h)+2./5.*pi);
plot(t,m.*(posh-negh)./(2.*h));
xlabel('time(second)');
ylabel('force(N)');

% (c) Find F(8), 6 significant digits
% Central Difference
h = 10.^-8;
pos = -20.*exp(-0.01.*(8+h).^2).*sin(20.*pi.*(8+h)+2./5.*pi);
neg = -20.*exp(-0.01.*(8-h).^2).*sin(20.*pi.*(8-h)+2./5.*pi);
fprintf('(c) F(8) = %.6f N\n', m.*(pos-neg)./(2.*h));

% (d) x(t)=0, Find x(10), 8 significant digits
% (e) distance t=0~10, 8 significant digits
% (d)(e) Simpson's Method
clear all;
h = 10.^-4;
t = 0:h:10;
y = -20.*exp(-0.01.*t.^2).*sin(20.*pi.*t+2./5.*pi);
for i=2:2:(10-0)./h
    y(i) = y(i).*4;
    y(i+1) = y(i+1).*2;
end
y(i+1) = y(i+1)./2;
y = h./3.*y;
fprintf('(d) x(10) = %.8f m\n', sum(y));
fprintf('(e) The total travel length from t = 0 to 10 is %.9f m\n', sum(abs(y)));