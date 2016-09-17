function [codeRate] = calcRateRSLowPrecision(berIn, berOut)
% Calculate code rate required to obtain post-FEC BER given pre-FEC BER.
% The code is RS(255, k) with 8-bit symbols, 255 is the codeword length, 
% k is the number of information bits, which is determined here.

load berOutLowPrecision.mat
% This mat file has two variables:
% ber_in: vector, pre-FEC BER, 10.^(-10:0.1:-0.1)
% ber_out: precalculated post-FEC BER. Each row corresponds to one code
% rate. Different elements in the same row are the post-FEC BER given the
% corresponding pre-FEC BER.

% This function interpolates the ber_out table to calculate the required
% code rate.

ber_in = -10 : 0.1 : -1;
ber_in = 10 .^ ber_in;
n_ber_in = length(ber_in);
n_rates = 128;

xgrid = repmat(ber_in, n_rates, 1);
ygrid = data;
zgrid = repmat((2*[1:n_rates]'-1)/255, 1, n_ber_in);
warning('off', 'MATLAB:scatteredInterpolant:DupPtsAvValuesWarnId');
codeRate = griddata(xgrid, ygrid, zgrid, berIn, berOut);