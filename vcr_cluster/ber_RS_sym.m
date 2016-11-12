function ber_out = ber_RS_sym(ber_in, n, k, q)
% Calculates the relation between the inputted BER and the outputted
% BER for the RS code.
x = sym(ber_in, 'd');
ser_in = 1-(1-x)^q;
t = floor((n-k)/2);
ser_out = 0;
spmd
    warning('off', 'MATLAB:dispatcher:pathWarning');
    warning('off', 'MATLAB:nchoosek:LargeCoefficient');
end
parfor i = t+1:n
    ser_out = ser_out + i*nchoosek(n, i)*ser_in^i*(1-ser_in)^(n-i);
end
ser_out = ser_out/n;
ber_out = (1-(1-ser_out)^(1/q));
ber_out = double(ber_out);
end