% Monte Carlo Integration
% x.^2./4 + y.^2 + z.^2./9 = 1

% FORMAT :
% A total of xxxxx random points are used and the volume of the ellipsoid is xxxxx.

clear all;
clc;

a = 2;
b = 1;
c = 3;
N = 10.^7;
hit = 0;
for i=1:N
    if(rand().^2+rand().^2+rand().^2 <= 1)
        hit = hit + 1;
    end
end
est = 8.*a.*b.*c.*hit./N;
fprintf('A total of %d random points are used and the volume of the ellipsoid is %.7f.\n',N,est);