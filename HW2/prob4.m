function [sum2D] = prob4(x,y,z,Q,S)
% Simpson's Method(2D)
% x : charge's coordinate on x-axis
% y : charge's coordinate on y-axis
% z : charge's coordinate on z-axis
% Q : amount of charge (Coulomb)
% S : side length of the cube centered at (0,0,0)
k = 9.*10.^9;
s = S./2;
h = 10.^-3;

% array for Simpson's Method (convenient for 2D integration)
T(1) = 1;
for i=2:2:S./h
    T(i) = 4;
    T(i+1) = 2;
end
T(i+1) = 1;

% Integration (calculation simplified)
sum2D = 0;
for i=-s:h:s
    sum1D = 0;
    for j=-s:h:s
        temp = 0;
        temp = temp + (s-z)./((i-x).^2+(j-y).^2+(s-z).^2).^(3/2);
        temp = temp + (s-x)./((s-x).^2+(i-y).^2+(j-z).^2).^(3/2);
        temp = temp + (s-y)./((j-x).^2+(s-y).^2+(i-z).^2).^(3/2);
        temp = temp + (s+z)./((i-x).^2+(j-y).^2+(s+z).^2).^(3/2);
        temp = temp + (s+x)./((s+x).^2+(i-y).^2+(j-z).^2).^(3/2);
        temp = temp + (s+y)./((j-x).^2+(s+y).^2+(i-z).^2).^(3/2);
        sum1D = sum1D + temp.*T(int32((j+s)./h+1));
    end
    sum2D = sum2D + sum1D.*T(int32((i+s)./h+1));
end
sum2D = k.*Q.*sum2D.*h.^2./9;
end