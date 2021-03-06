function [cr, k] = calcRateBCH(n, berIn, berOut)

old = digits(100);
fileName = sprintf('BCH%d.mat', n);
load(fileName)
for i=1:size(bch, 1)
    [postFEC, ~] = ber_BCH_sym(berIn, n, bch(i,2), berOut*1e-5);
    if postFEC<berOut
        break
    end
end
cr = bch(i,1)/n;
k = bch(i, 1);
digits(old);