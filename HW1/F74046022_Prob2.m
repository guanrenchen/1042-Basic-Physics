clear all;
clc;

% plot the electric field
for i = -4:1:4
    for j = -4:1:4
        PlotArrow(i, j);
    end
end
xlabel('x');
ylabel('y');
