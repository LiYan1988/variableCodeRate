clc;
clear;
close all;

n = 255;
q = 8;

old = digits(70);
ber_in = -10: 0.1 : -0.1;
ber_in = 10 .^ ber_in;
N = length(ber_in);
ber_out = zeros((n + 1) / 2, N);
for k = 1 : 128
    for i = 1 : N
        ber_out(k, i) = ber_RS_sym(ber_in(i), n, 2 * k - 1, q);
        fprintf('(%d, %d) finished.\n', k, i);
    end
end
digits(30);


save('RS_ber.mat', 'ber_out', 'ber_in');