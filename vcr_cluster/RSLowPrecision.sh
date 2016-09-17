#!/usr/bin/env bash
#SBATCH -A C3SE2016-1-11
#SBATCH -p glenn
#SBATCH -J RSLowPrecision
#SBATCH -N 1
#SBATCH -C HUGEMEM
#SBATCH -t 48:00:00
#SBATCH -o RSLowPrecision.stdout
#SBATCH -e RSLowPrecision.stderr

module load matlab
export DISABLE_MDCS=''

cp *.m $TMPDIR
cd $TMPDIR

flags='-nodisplay -singleCompThread'

matlab ${flags} -r scriptParLowPrecision

cp *.mat $SLURM_SUBMIT_DIR

