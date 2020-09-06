function [ Num ] = SngBinToNum( SngBin )
% initialize variable for conversion
    Num = 0;
% convert single binary representation into decimal
    for i=2:1:32
        if(SngBin(i)==1)
            Num = Num + 2.^(9-i);
        end
    end
%  add the sign
    if(SngBin(1)==0)
        Num = Num.*1;
    else
        Num = Num.*-1;
    end
end

