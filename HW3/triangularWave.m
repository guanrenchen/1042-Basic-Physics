function [ e ] = Untitled2( t )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    pos = rem(1000.*t,40);
    if(pos<10)
        e = pos./2;
    end
    if(pos>=30)
        e = -5 + (pos-30)./2;
    end
    if(pos>=10 & pos <30)
        e = 5-(pos-10)./2;
    end

end

