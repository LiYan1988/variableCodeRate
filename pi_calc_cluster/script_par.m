%% configure cluster
[~, tmpdir] = system('echo $TMPDIR');
sched = parcluster('local');
sched.NumWorkers = 16;
sched.JobStorageLocation = tmpdir(1:end-1);
parpool(sched,16)

%% run 
N = 32; N_blocks = 100;
[pi_approx, N_hits] = pi_calc_parfor(N, N_blocks);
poolobj = gcp('nocreate');
delete(poolobj)
data = struct('N', N*N_blocks, 'N_hits', N_hits, 'pi_approx', pi_approx);

%% save data and quit matlab
store_data(data, 'PI_PARFOR');
quit

