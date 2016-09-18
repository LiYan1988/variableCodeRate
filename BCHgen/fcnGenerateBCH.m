function fcnGenerateBCH(N)

bch = []; % overhead, #correctable errors
for i = 1:N-1
    try
        [~,t(i)] = bchgenpoly(N, N-i);
        bch = [bch; [N-i, t(i)]];
        fprintf('BCH (%d, %d) exists\n', N, i);
    catch ME
%         if (strcmp(ME.identifier,'comm:bchnumerr:InvalidNK'))
%             fprintf('BCH (%d, %d) does not exist.\n', n, i);
%         end
    end
end
fileName = sprintf('BCH%d.mat',N);
save(fileName, 'bch');
