program hello

  use mpi
  implicit none

  integer :: ifail
  integer :: rank, size

  call mpi_init(ifail)

  call mpi_comm_rank(MPI_COMM_WORLD, rank, ifail)
  call mpi_comm_size(MPI_COMM_WORLD, size, ifail)

  write (unit = *, fmt = *) "Hello from rank ", rank, " of ", size

  call mpi_finalize(ifail)

end program hello
