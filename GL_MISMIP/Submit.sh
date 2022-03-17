#!/bin/bash
#SBATCH -o /work/bm1164/m300832/ContinentalSetup/GL_MISMIP/SLURM_job.%j.%N.out
#SBATCH -e /work/bm1164/m300832/ContinentalSetup/GL_MISMIP/SLURM_job.%j.%N.err
#SBATCH -D /work/bm1164/m300832/ContinentalSetup/GL_MISMIP/
#SBATCH -J IceRiseForward
#SBATCH --get-user-env
#SBATCH --account=bm1164
#SBATCH --ntasks=1
#SBATCH --time=08:00:00
#SBATCH --partition=compute,compute2
#=================================================================================================================
set -e
echo Here comes the Nodelist:
echo $SLURM_JOB_NODELIST

echo Here comes the partition the job runs in:
echo $SLURM_JOB_PARTITION
cd $SLURM_SUBMIT_DIR

source ModulesPlusPathsMistral.sh

cp $ELMER_HOME/share/elmersolver/lib/FreeSurfaceSolver.so MyFreeSurfaceSolver.so
ElmerSolver mismip.sif
