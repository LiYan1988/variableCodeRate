clc;
clear;
close all;

q = 8;
n = 2^q-1;
% t = 1:127;
for t = 33:2^(q-1)-1
    Eti = cell(q*n, 1);
    parfor i = 1:q*n
        if i<t+1
            Eti{i} = 0;
        else
            fprintf('Calculating Eti with t=%d and i=%d...\n', t, i)
            Eti{i} = calcEti(i, t, n, q);
        end
    end
    filename = sprintf('Eti_t%d.mat', t);
    save(filename, 'Eti')
end