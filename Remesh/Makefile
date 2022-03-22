# Makefile for Elmer
# ----------------------------------------
# Use external Geometry to create mesh
# Calculate Depth and Height for Paraview

EXECUTABLES = src/DistanceSolverRD 

# The following lines were changed for consistency with the original mistal setup:
NumProcs=1
NumProcx=1
NumProcy=1

InputSif=Remesh.sif



.SUFFIXES: .f90

all: clean ini grid submit

grid:
	#ElmerGrid 2 2 Mesh -partition 10 8 1 -autoclean
	# The following line was previously used:
	#ElmerGrid 2 2 Mesh -metis 80 4  -autoclean
	# New lines (2):
	gmsh Mesh.geo -1 -2
	ElmerGrid 14 2 Mesh.msh  -autoclean

submit: ini
	# Previous command:
	# mpirun -n 80 ElmerSolver_mpi
	# New command:
	mpirun -n 1 ElmerSolver_mpi

compile:  
	elmerf90 src/DistanceSolveRD.f90 -o src/DistanceSolveRD
	elmerf90 src/BedrockBump.f90 -o src/BedrockBump
	elmerf90 src/GroundedMaskSolver.f90 -o src/GroundedMaskSolver
	elmerf90 src/SeaLevel.f90 -o src/SeaLevel
	elmerf90 src/USF_BMB.f90 -o src/USF_BMB; elmerf90 -o src/USF_Contact src/USF_Contact.f90 src/USF_Sliding.f90

clean:
	rm -fr results/*

ini:
	# Old line:
	# echo Init.sif > ELMERSOLVER_STARTINFO
	# New line:
	echo Remesh.sif > ELMERSOLVER_STARTINFO

.f90:
	# Old line:
	# elmerf90  -o Init.sif 10 8 1 80 Mistral $<
	# New line:
	elmerf90  -o IceRiseRemesh.sif $<
.c:
	# Old line:
	# gcc  -o Init.sif 10 8 1 80 Mistral $< -lm
	# New line:
	gcc  -o IceRiseRemesh.sif $< -lm
