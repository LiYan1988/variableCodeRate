function [codeRate] = calcRateRS(berIn, berOut)
% Calculate code rate required to obtain post-FEC BER given pre-FEC BER.
% The code is RS(255, k) with 8-bit symbols, 255 is the codeword length, 
% k is the number of information bits, which is determined here.

load RS_ber.mat
% This mat file has two variables:
% ber_in: vector, pre-FEC BER, 10.^(-10:0.1:-0.1)
% ber_out: precalculated post-FEC BER. Each row corresponds to one code
% rate. Different elements in the same row are the post-FEC BER given the
% corresponding pre-FEC BER.

% This function interpolates the ber_out table to calculate the required
% code rate.

xgrid = repmat(ber_in, 128, 1);
ygrid = ber_out;
zgrid = repmat((2*[1:128]'-1)/255, 1, 100);
warning('off', 'MATLAB:scatteredInterpolant:DupPtsAvValuesWarnId');
codeRate = griddata(xgrid, ygrid, zgrid, berIn, berOut);