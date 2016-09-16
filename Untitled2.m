%% reproduce Fig. 6/G.975
clc;
clear;
close;


n = 255; % length of the codeword
k = 239; % length of the information bytes
q = 8; % number of bits in one byte

old = digits(70);
ber_in = 10.^(-9:0.1:-3);
ber_out = zeros(length(ber_in), 1);
for i = 1:length(ber_in)
    ber_out(i) = ber_RS_sym(ber_in(i), n, k, q);
end
ber_in = -log10(ber_in);
ber_out = -log10(ber_out);
digits(32)

figure(); hold on; box on; grid on;
plot(ber_in, ber_in, 'b.')
plot(ber_in, ber_out, 'r')
xlabel('-log_{10}(BER_{in})')
ylabel('-log_{10}(BER_{out})')
legend('without FEC', 'with FEC', 'location', 'best')
% ConvertPlot4Publication('inVSout', 'pdf', 'on', 'width', 5, 'height', 4)