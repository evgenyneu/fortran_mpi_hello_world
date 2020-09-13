! Runs multiple programs in parallel using MPI
! (https://en.wikipedia.org/wiki/Message_Passing_Interface)
! Based on https://support.pawsey.org.au/documentation/display/US/Message+Passing+Interface
program hello

  use mpi
  implicit none

  integer :: ifail
  integer :: rank, size

  call mpi_init(ifail)

  call mpi_comm_rank(MPI_COMM_WORLD, rank, ifail)
  call mpi_comm_size(MPI_COMM_WORLD, size, ifail)

  ! Each process prints out its ID and the total number of processes
  write (unit = *, fmt = *) "Hello from rank ", rank, " of ", size

  call mpi_finalize(ifail)

end program hello
