export ELMER_HOME="/home/m/m300792/ModelCodes/elmerice/Elmer_devel_03-14-22"
export ELMER_SOLVER_HOME="$ELMER_HOME/bin"
# Path to ElmerSolver
export PATH=/home/m/m300792/ModelCodes/elmerice/Elmer_devel_03-14-22/bin/:$PATH
# Path to Gmsh meshing software. (Maybe time to update to newer version??)
export  PATH=/home/m/m300792/ModelCodes/ThirdPartySoftware/gmsh-2.12.0-source/build03-14-22/bin:$PATH
# This needs to be added to find Elmer functions compiled in areas other than
# the standard lib location (using for example relative paths)
export LD_LIBRARY_PATH="/home/m/m300792/ModelCodes/elmerice/Elmer_devel_03-14-22/share/elmersolver/lib:$LD_LIBRARY_PATH"
#MKL Library
export LD_LIBRARY_PATH="/home/m/m300792/sw-spack/intel-oneapi-mkl-2022.0.1-oaq36n/mkl/2022.0.1/lib/intel64:$LD_LIBRARY_PATH"
# NetCDF-fortran library
export LD_LIBRARY_PATH="/sw/spack-levante/netcdf-fortran-4.5.3-k6xq5g/lib/:$LD_LIBRARY_PATH"
# NetCDF-c library
export LD_LIBRARY_PATH="/sw/spack-levante/netcdf-c-4.8.1-2k3cmu/lib:$LD_LIBRARY_PATH"
