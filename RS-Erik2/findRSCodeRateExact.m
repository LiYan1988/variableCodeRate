function [codeRate] = findRSCodeRateExact(berIn)
% Calculate code rate required to obtain the post-FEC BER of 10^(-12) given 
% pre-FEC BER. The code is RS(255, k, 8).

preFecExactBer = importBER('preFECBER.csv');

if berIn > preFecExactBer(1)
    codeRate = 0;
else
    for i = 1:127
        if berIn <= preFecExactBer(128-i)
            codeRate = (255-2*i)/255;
            break;
        end
    end
end