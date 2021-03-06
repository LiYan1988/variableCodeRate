function [codeRate] = searchRateRS(berIn, berOut)
% Calculate code rate required to obtain post-FEC BER given pre-FEC BER.
% The code is RS(255, k) with 8-bit symbols, 255 is the codeword length, 
% k is the number of information bits, which is determined here.

warning('off','all')

load berRS.mat
% This mat file has two variables:
% ber_in: vector, pre-FEC BER, 10.^(-10:0.1:-0.1)
% ber_out: precalculated post-FEC BER. Each row corresponds to one code
% rate. Different elements in the same row are the post-FEC BER given the
% corresponding pre-FEC BER.

% This function interpolates the ber_out table to calculate the required
% code rate.

ber_in = -10 : 0.1 : -1;
ber_in = 10 .^ ber_in;
colidx = 1;
for i = 2:length(ber_in)
    if ber_in(i)>berIn
        colidx = i;
        break;
    end
end
if i==length(ber_in)
    colidx = length(ber_in);
end

berOutVector = data(:, colidx);
rowidx = 128;
for i = 127:-1:1
    if berOutVector(i)<berOut
        rowidx = i;
        break;
    end
end
if i==1
    rowidx=1;
end

codeRate = (2*rowidx-1)/255;