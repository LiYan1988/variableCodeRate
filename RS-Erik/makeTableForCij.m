clc;
clear;
close all;
% This file precalculate all the values of Cij, which will be used in the
% calculation of Eti


% binary bits per code word
q = 8; 
% number of code words per code block
n = 2^q-1; 
% maximum number of correctable code word in one code block
tmax = 2^(q-1)-1; 
% maximum value of i
imax = q*tmax;
% a table contains all the precalculated Cij values
CijTable = cell(imax, tmax);
% name of files to save the table
filename = sprintf('CijTable.mat');
% i means the number of bit errors, j means the number of code word errors
% if i is fixed, then the minimum of j is ceil(i/q), the max of j is
% min(i,n), but since (63) is used for the calculation of Eti, j<=t is
% needed. So jmax=min(i, n, tmax)=min(i, tmax).
for i = 1:imax
    fprintf('Calculating Cij with i=%d...\n', i)
    % lower bounds of j
    jmin = ceil(i/q);
    jmax = min(tmax, i);
    parfor j = 1:tmax
        %fprintf('j=%d\n', j)
        if j < jmin || j > jmax
            CijTable{i, j} = 0;
        else
            CijTable{i, j} = calcCij(i, j, n, q);
        end
    end
    save(filename, 'CijTable');
end
