#!/usr/bin/env bash
#SBATCH -A C3SE2016-1-11
#SBATCH -p glenn
#SBATCH -J generateBCH4095
#SBATCH -N 1
#SBATCH -C SMALLMEM
#SBATCH -t 48:00:00
#SBATCH -o generateBCH4095.stdout
#SBATCH -e generateBCH4095.stderr

module load matlab
export DISABLE_MDCS=''

cp *.m $TMPDIR
cd $TMPDIR

flags='-nodisplay -singleCompThread'
cmd='fcnGenerateBCH(4095); quit'

matlab ${flags} -r "${cmd}"

cp *.mat $SLURM_SUBMIT_DIR

