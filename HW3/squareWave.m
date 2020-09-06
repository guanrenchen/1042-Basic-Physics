function [ e ] = Untitled( t )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if(rem(1000.*t,20)<10) 
        e = 5;
    else
        e = -5;
    end;
end

