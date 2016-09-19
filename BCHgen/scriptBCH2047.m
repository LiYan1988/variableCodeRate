%% configure cluster
% [~, tmpdir] = system('echo $TMPDIR');
% sched = parcluster('local');
% sched.NumWorkers = 16;
% sched.JobStorageLocation = tmpdir(1:end-1);
% parpool(sched,16)

%% run code
load BCH2047.mat
n = 2047;
old = digits(100);
ber_in = -10: 0.1 : -1;
ber_in = 10 .^ ber_in;
N = length(ber_in);
ber_out = zeros(size(bch, 1), N);
for k = 1 : size(bch, 1)
    for i = 1 : N
        ber_out(k, i) = ber_BCH_sym(ber_in(i), n, bch(i, 2), 1e-30);
        fprintf('(%d, %d) finished, pre-FEC: %.4e, post-FEC: %.4e.\n',...
            k,i,ber_in(i),ber_out(k,i));
    end
end
digits(old);

%% close parpool
% poolobj = gcp('nocreate');
% delete(poolobj)

%% save data and quit matlab
store_data(ber_out, 'berBCH');
% quit

