#!/usr/bin/env bash
#SBATCH -A C3SE2016-1-11
#SBATCH -p glenn
#SBATCH -J job_simple1
#SBATCH -N 1
#SBATCH -t 00:01:00
#SBATCH -o job_simple1.stdout
#SBATCH -e job_simple1.stderr


module load matlab

pdcp * $TMPDIR

flags='-nodisplay -singleCompThread'
cmd='pi_calc_tofile(1e6); quit'
matlab ${flags} -r "${cmd}"

cp * $SLURM_SUBMIT_DIR