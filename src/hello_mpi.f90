module HelloMpi
use mpi
use Constants, only: OUTPUT_LENGTH
implicit none
private
public :: hello_mpi

contains

function hello_mpi(silent) result(result)
  logical, intent(in) :: silent
  character(len=OUTPUT_LENGTH) :: result

  integer :: ifail
  integer :: rank, size

  call mpi_init(ifail)

  call mpi_comm_rank(MPI_COMM_WORLD, rank, ifail)
  call mpi_comm_size(MPI_COMM_WORLD, size, ifail)

  write(result, '(a, i2, x, a, i2)') "Hello from rank", rank, "of", size

  if (.not. silent) write (0, *) trim(result)

  call mpi_finalize(ifail)
end function


end module HelloMpi
