#!/usr/bin/env bash
#SBATCH -A C3SE2016-1-11
#SBATCH -p glenn
#SBATCH -J job_simple1_par
#SBATCH -N 1
#SBATCH -t 00:01:00
#SBATCH -o job_simple1_par.stdout
#SBATCH -e job_simple_par.stderr

module load matlab
export DISABLE_MDCS=''

cp *.m $TMPDIR
cd $TMPDIR

flags='-nodisplay -singleCompThread'

cat > script.m <<EOF
[~, tmpdir] = system('echo $TMPDIR');
sched = parcluster('local');
sched.NumWorkers = 16;
sched.JobStorageLocation = tmpdir(1:end-1)
parpool(sched,16)

N = 32; N_blocks = 100;
[pi_approx, N_hits] = pi_calc_parfor(N, N_blocks);
poolobj = gcp('nocreate');
delete(poolobj)
data = struct('N', N*N_blocks, 'N_hits', N_hits, 'pi_approx', pi_approx);
store_data(data, 'PI_PARFOR');
quit
EOF

matlab ${flags} -r script

cp *.mat $SLURM_SUBMIT_DIR