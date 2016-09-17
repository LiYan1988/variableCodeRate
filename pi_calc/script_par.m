[~, tmpdir] = system('echo $TMPDIR');
sched = parcluster('local');
sched.NumWorkers = 2;
sched.JobStorageLocation = tmpdir(1:end-1);
parpool(sched,2)

N = 32; N_blocks = 100;
[pi_approx, N_hits] = pi_calc_parfor(N, N_blocks);
poolobj = gcp('nocreate');
delete(poolobj)
data = struct('N', N*N_blocks, 'N_hits', N_hits, 'pi_approx', pi_approx);
store_data(data, 'PI_PARFOR');
quit
