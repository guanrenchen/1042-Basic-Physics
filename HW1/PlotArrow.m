function [  ] = PlotArrow( a, b )
    % acquire the vector
    x = a/(a.^2+b.^2).^(3/2);
    y = b/(a.^2+b.^2).^(3/2);
    % draw the arrow (center at grid point)
    line([a-x./2,a+x./2],[b-y./2,b+y./2]);
    % use rotation matrix to draw the arrow head
    spin150 = [cos(5./6.*pi), sin(5./6.*pi); -sin(5./6.*pi), cos(5./6.*pi)];
    spin210 = [cos(7./6.*pi), sin(7./6.*pi); -sin(7./6.*pi), cos(7./6.*pi)];
    head1 = spin150*[x;y]./3; 
    head2 = spin210*[x;y]./3;
    line([a+x./2,a+x./2+head1(1)],[b+y./2,b+y./2+head1(2)]);
    line([a+x./2,a+x./2+head2(1)],[b+y./2,b+y./2+head2(2)]);
    hold on;
end

