#!/usr/bin/env bash
#SBATCH -A C3SE2016-1-11
#SBATCH -p glenn
#SBATCH -J job_simple_par
#SBATCH -N 1
#SBATCH -t 00:03:00
#SBATCH -o job_simple_par.stdout
#SBATCH -e job_simple_par.stderr

module load matlab
export DISABLE_MDCS=''

cp *.m $TMPDIR
cd $TMPDIR

flags='-nodisplay -singleCompThread'

matlab ${flags} -r script_par

cp *.mat $SLURM_SUBMIT_DIR

