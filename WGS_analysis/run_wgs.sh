#!/bin/bash
#SBATCH --job-name=wgs_cnv
#SBATCH --output=logs/%x-%j.log
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1
#SBATCH --mem=16G
#SBATCH --time=14-00

mkdir -p logs

export TMPDIR= # Add temporary folder name
mkdir -p ${TMPDIR}

eval "$(conda shell.bash hook)"
mamba activate cnv_analysis

set -x

snakemake \
    -s Snakefile \
    --profile= # Add snakemake profile \
    -j 20 \
    -k \
    -p \
    --restart-times=2
