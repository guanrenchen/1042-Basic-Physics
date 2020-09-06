clear all;
clc;

% earth and the object have the same angular velocity
% w : angular velocity
% a : acceleration
% r : radius
% a./r == w.^2 
% use a./r to acquire equation

% Ms : mass of sun
% Me : mass of earth
% Rsm : distance between sun and object
% Rse : distance between sun and earth
% L1 : (Ms./Rsm.^2 - Me./(Rse-Rsm).^2)./Rsm == Ms./Rse^3
% L2 : (Ms./Rsm.^2 + Me./(Rsm-Rse).^2)./Rsm == Ms./Rse^3
% L3 : (Ms./Rsm.^2 + Me./(Rsm+Rse).^2)./Rsm == Ms./Rse^3

% x = Rsm./Rse;
% L1 : (x-1).^2.*x - (x.^(-1)-1).^2 + Me./Ms == 0
% L2 : (x-1).^2.*x - (x.^(-1)-1).^2 - Me./Ms == 0
% L3 : (x+1).^2.*x - (x.^(-1)+1).^2 - Me./Ms == 0
Ms = 1.98892.*10.^30;
Me = 5.97219.*10.^24;



% L1 : (x-1).^2.*x - (x.^(-1)-1).^2 + Me./Ms == 0
% Bisection method
xL = 0;
xR = 2;
for int=1:1000
    mid = (xL+xR)/2;
    xLy = (xL-1).^2.*xL - (xL.^(-1)-1).^2 + Me./Ms;
    midy = (mid-1).^2.*mid - (mid.^(-1)-1).^2 + Me./Ms;
    xRy = (xR-1).^2.*xR - (xR.^(-1)-1).^2 + Me./Ms;
    if(xLy.*midy < 0)
        xR = mid;
    else 
        xL = mid;
    end
end
fprintf('The distance ratio of L1: %.20f\n', mid);

% L2 : (x-1).^2.*x - (x.^(-1)-1).^2 - Me./Ms == 0
% Bisection method
xL = 0;
xR = 2;
f = @(x) (x-1).^2.*x - (x.^(-1)-1).^2 - Me./Ms;
for int=1:1000
    mid = (xL+xR)/2;
    if(f(xL)*f(mid) < 0)
        xR = mid;
    else
        xL = mid;
    end
end
fprintf('The distance ratio of L2: %.20f\n', mid);

% L3 : (x+1).^2.*x - (x.^(-1)+1).^2 - Me./Ms == 0
% Bisection method
xL = 0;
xR = 2;
for int=1:1000
    mid = (xL+xR)/2;
    xLy = (xL+1).^2.*xL - (xL.^(-1)+1).^2 - Me./Ms;
    midy = (mid+1).^2.*mid - (mid.^(-1)+1).^2 - Me./Ms;
    xRy = (xR+1).^2.*xR - (xR.^(-1)+1).^2 - Me./Ms;
    if(xLy.*midy < 0)
        xR = mid;
    else
        xL = mid;
    end
end
fprintf('The distance ratio of L3: %.20f\n', mid);

