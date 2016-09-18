clc;
close all;
clear;

n = 2047;
bch = []; % overhead, #correctable errors
for i = 1:2046
    try
        [~,t(i)] = bchgenpoly(n, n-i);
        bch = [bch; [n-i, t(i)]];
        fprintf('BCH (%d, %d) exists\n', n, i);
    catch ME
%         if (strcmp(ME.identifier,'comm:bchnumerr:InvalidNK'))
%             fprintf('BCH (%d, %d) does not exist.\n', n, i);
%         end
    end
end
save('BCH2047.mat', bch);