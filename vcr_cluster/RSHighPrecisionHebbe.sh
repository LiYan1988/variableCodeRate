#!/usr/bin/env bash
#SBATCH -A C3SE2016-1-11
#SBATCH -p hebbe
#SBATCH -J RSHighPrecision
#SBATCH -N 1
#SBATCH -C MEM512
#SBATCH -t 6-00:00:00
#SBATCH -o RSHighPrecision.stdout
#SBATCH -e RSHighPrecision.stderr

module load matlab
export DISABLE_MDCS=''

cp *.m $TMPDIR
cd $TMPDIR

flags='-nodisplay -singleCompThread'

matlab ${flags} -r scriptParHighPrecisionHebbe

cp *.mat $SLURM_SUBMIT_DIR

