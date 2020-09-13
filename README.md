# A Hello World MPI program written in python

Runs multiple programs in parallel using [MPI](https://en.wikipedia.org/wiki/Message_Passing_Interface). Based on [this manual](https://support.pawsey.org.au/documentation/display/US/Message+Passing+Interface).

## Setup

To install MPI on Mac use

```
brew install open-mpi
111

## Compile

```
mpifort hello_mpi.f90 -o bin/mpi
```

## Run

Example of running two processes.

```
mpiexec -n 2 ./bin/mpi
```

Each process will print its ID and the total number of processes.

```
Hello from rank            0  of            2
Hello from rank            1  of            2
```
