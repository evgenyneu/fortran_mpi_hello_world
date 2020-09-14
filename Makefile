#
# Makefile for building and testing a fortran program
# ----------------------------------
#
# Build executable build/main:
#
# 	$ make
#
# Build unit tests executable build/test:
#
# 	$ make test
#
# Remove build files:
#
# 	$ make clean
#
# This Makefile is based on https://stackoverflow.com/a/30142139/297131
#

# Fortran compiler from Open MPI for Mac, Ubuntu
FC=mpifort

# Compiler flags for gfortran
FFLAGS=-J$(@D) -Wall -Wextra -g

# Compiler flags for ifort and ftn
# FFLAGS=-module $(@D) -no-wrap-margin

include Makefile.common
