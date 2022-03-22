#!/bin/bash
#SBATCH -o /work/bm1164/from_Mistral/bm1164/m300832/ContinentalSetup/Init/Logs/SLURM_job.%j.%N.out
#SBATCH -e /work/bm1164/from_Mistral/bm1164/m300832/ContinentalSetup/Init/Logs/SLURM_job.%j.%N.err
#SBATCH -D /work/bm1164/from_Mistral/bm1164/m300832/ContinentalSetup/Init/
#SBATCH -J Init
#SBATCH --get-user-env
#SBATCH --account=bm1164
#SBATCH --ntasks=80
#SBATCH --time=00:10:00
#SBATCH --partition=compute
#=================================================================================================================
export OMPI_MCA_pml="ucx"
export OMPI_MCA_btl=self
export OMPI_MCA_osc="pt2pt"
export UCX_IB_ADDR_TYPE=ib_global
# for most runs one may or may not want to disable HCOLL
export OMPI_MCA_coll="^ml,hcoll"
export OMPI_MCA_coll_hcoll_enable="0"
export HCOLL_ENABLE_MCAST_ALL="0"
export HCOLL_MAIN_IB=mlx5_0:1
export UCX_NET_DEVICES=mlx5_0:1
export UCX_TLS=mm,knem,cma,dc_mlx5,dc_x,self
export UCX_UNIFIED_MODE=y
export HDF5_USE_FILE_LOCKING=FALSE
export OMPI_MCA_io="romio321"
export UCX_HANDLE_ERRORS=bt

ulimit -s 102400
ulimit -c 0

set -e
echo Here comes the Nodelist:
echo $SLURM_JOB_NODELIST

echo Here comes the partition the job runs in:
echo $SLURM_JOB_PARTITION
cd $SLURM_SUBMIT_DIR

source ModulesPlusPaths2LoadIntel.sh

cp $ELMER_HOME/share/elmersolver/lib/FreeSurfaceSolver.so src/MyFreeSurfaceSolver.so
echo $ELMER_HOME
echo $ELMER_SOLVER_HOME

#YearCounter=$1
#YearCounterFormatted=$(printf %06d $YearCounter)
#sed -i "s/FORMAT/${YearCounterFormatted}/g" Forward.sif
#echo YearCounter is: 
make compile
make ini
make grid
srun -l --export=ALL --cpu_bind=cores --distribution=block:cyclic -n 80 ElmerSolver_mpi Init.sif
#if [ "${YearCounter}" -lt "1000" ]; then
#	if [ "1" -eq 1 ]; then
#					cp Mesh/*result* /work/bm1164/m300832/CodeThatWorks/SyntheticExperiments//Tolerance6/Forward/Mesh/
#					cp Mesh/mesh* /work/bm1164/m300832/CodeThatWorks/SyntheticExperiments//Tolerance6/Forward/Mesh/
#					cd /work/bm1164/m300832/CodeThatWorks/SyntheticExperiments//Tolerance6/Forward
#					sbatch Submit.sh $YearCounter
#	fi
#fi
