module HelloMpi
use mpi
implicit none
private
public :: hello_mpi

contains

function hello_mpi() result(result)
  logical :: result

  integer :: ifail
  integer :: rank, size

  call mpi_init(ifail)

  call mpi_comm_rank(MPI_COMM_WORLD, rank, ifail)
  call mpi_comm_size(MPI_COMM_WORLD, size, ifail)

  ! Each process prints out its ID and the total number of processes
  write (unit = *, fmt = *) "Hello from rank ", rank, " of ", size

  call mpi_finalize(ifail)

  result = .true.
end function


end module HelloMpi
