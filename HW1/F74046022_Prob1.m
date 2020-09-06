clear all;
clc;

%three numbers for demonstration
num(1) = 123.456789;
num(2) = -111.111111;
num(3) = 0.0625;
for i=1:3   % one number per loop
    % converts number into single binary representation
    SngBin = NumToSngBin(num(i));
    %converts back to decimal
    Num = SngBinToNum(SngBin);
    fprintf('The binary representation of %f is [', num(i));
    for i=1:32
        fprintf('%d', SngBin(i));
    end
    fprintf('];\nThe decimal respresentation of [');
    for i=1:32
        fprintf('%d', SngBin(i));
    end
    fprintf('] is %f;\n', Num);
end