# A Hello World MPI program written in Fortran

Runs multiple program processes in parallel using [MPI](https://en.wikipedia.org/wiki/Message_Passing_Interface) and prints a 'hello' message from each process:

```
 Hello from rank 1 of 2
 Hello from rank 0 of 2
```

I wrote this program in order to learn how to run an MPI program on [Magnus supercomputer](https://support.pawsey.org.au/documentation/display/US/Supercomputing+Documentation). Based on [this manual](https://support.pawsey.org.au/documentation/display/US/Message+Passing+Interface).

## Install Open MPI

Mac:

```
brew install open-mpi
```

Ubuntu:

```
sudo apt install openmpi-bin
sudo apt install libopenmpi-dev
```


## Download


```
git clone https://github.com/evgenyneu/fortran_mpi_hello_world.git
cd fortran_mpi_hello_world
```


## Compile

```
make
```

### Compile on Magnus

```
make -f Makefile.magnus
```

## Run

Example of running two processes:

```
mpiexec -n 2 ./build/hello_mpi
```

Each process will print its ID and the total number of processes.

```
 Hello from rank 1 of 2
 Hello from rank 0 of 2
```

### Run on Magnus

One can not run an executable directly from the login node, because it is cross-compiled for the compute nodes. Instead, allocate a [SLURM job](https://support.pawsey.org.au/documentation/display/US/Submitting+and+Monitoring+Jobs) interactively, using one node for one minute in debug queue:

```
salloc -N 1 -p debugq -t 0:01:00
```

salloc output:

```
salloc: Granted job allocation 5462788
salloc: Waiting for resource configuration
salloc: Nodes nid00011 are ready for job
```

Run the program using 12 processes:

```
srun --export=all -n 12 ./build/hello_mpi
```

Run output:

```
 Hello from rank 3 of 12
 Hello from rank 6 of 12
 Hello from rank 7 of 12
 Hello from rank 9 of 12
 Hello from rank 11 of 12
 Hello from rank 0 of 12
 Hello from rank 1 of 12
 Hello from rank 2 of 12
 Hello from rank 4 of 12
 Hello from rank 5 of 12
 Hello from rank 10 of 12
 Hello from rank 8 of 12
```

Exit the interactive job:

```
exit
```

### Submit a job to the queue on Magnus

Instead of submitting the job interactively, one can submit a job script to the queue.

```
sbatch magnus.job
```

Output:

```
Submitted batch job 5462955
```

Upon completion, it will create a file `slurm-5462955.out` containing program's output.


#### Check job status

```
sacct -j 5462955
```

## Run units tests


Compile:

```
make test
```

Run:

```
mpiexec -n 1 ./build/test
· · · · · · · · · · · ·
Tests finished successfully
```


## The unlicense

This work is in [public domain](LICENSE).
