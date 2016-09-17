#!/usr/bin/env bash
#SBATCH -A C3SE2016-1-11
#SBATCH -p glenn
#SBATCH -J RSHighPrecision
#SBATCH -N 1
#SBATCH -C HUGEMEM
#SBATCH -t 48:00:00
#SBATCH -o RSHighPrecision.stdout
#SBATCH -e RSHighPrecision.stderr

module load matlab
export DISABLE_MDCS=''

cp *.m $TMPDIR
cd $TMPDIR

flags='-nodisplay -singleCompThread'

matlab ${flags} -r scriptParHighPrecision

cp *.mat $SLURM_SUBMIT_DIR

