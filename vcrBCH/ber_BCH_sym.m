function [ber_out, i] = ber_BCH_sym(ber_in, n, t, th)
% Calculates post-FEC BER of BCH code with n bits, t correctable bits, with
% accuracy th (th>0 is required, if th<0 then with full accuracy).
x = sym(ber_in, 'd');
ber_out = 0;
% spmd
%     warning('off', 'MATLAB:dispatcher:pathWarning');
%     warning('off', 'MATLAB:nchoosek:LargeCoefficient');
% end

warning('off', 'MATLAB:dispatcher:pathWarning');
warning('off', 'MATLAB:nchoosek:LargeCoefficient');
for i = t+1:n
    ub = calcUB(n, i, x);
    if ub>th
        ber_out = ber_out + i*nchoosek(n, i)*x^i*(1-x)^(n-i)/n;
    else
        break
    end
    if ber_out>1
        break
    end
end
ber_out = double(ber_out);
end