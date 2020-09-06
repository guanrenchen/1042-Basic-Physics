% Gauss's Law of Electrostatics
% (1) center(0,0,0), square(1*1*1)
% (2) square(2*2*2)
% (3) following(2), center(0.4,0.4,0.4)
% (4) following(3), center(2,2,2)

% FORMAT : (6 significant digits)
% The total flux is xxxxx (Volt*m).
% The total flux is xxxxx (Volt*m).
% The total flux is xxxxx (Volt*m).
% The total flux is xxxxx (Volt*m).

clear all;
clc;
% prob4(x,y,z,Q,S)
fprintf('(1) The total flux is %.6f (Volt*m).\n',prob4(0,0,0,1,1));
fprintf('(2) The total flux is %.6f (Volt*m).\n',prob4(0,0,0,1,2));
fprintf('(3) The total flux is %.6f (Volt*m).\n',prob4(0.4,0.4,0.4,1,2));
fprintf('(4) The total flux is %.6f (Volt*m).\n',prob4(2,2,2,1,2));
% fprintf('%.6f\n', 4.*pi.*9.*10.^9);