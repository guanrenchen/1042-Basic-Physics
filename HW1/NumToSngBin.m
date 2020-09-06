function [ SngBin ] = NumToSngBin( Num )
% turns the number positive
    if(Num<0)
        SngBin(1)=1;
        Num = Num*-1;
    else
        SngBin(1)=0;
    end
% converts decimal into single binary representation using truncation/round-down
    for i=2:1:32
        if(Num >= 2.^(9-i))
            SngBin(i)=1;
            Num = Num - 2.^(9-i);
        else
            SngBin(i)=0;
        end
    end
end

