! Runs a program in parallel using MPI
! (https://en.wikipedia.org/wiki/Message_Passing_Interface)
module HelloMpi
use mpi
use Constants, only: OUTPUT_LENGTH
implicit none
private
public :: hello_mpi

contains

!
! Print the ID of the process and the total number of them.
!
! Inputs:
! --------
!
! silent : if true, do not print to output (used in unit tests)
!
! Outputs:
! -------
!
! Returns: hello world string from the process
!
function hello_mpi(silent) result(result)
  logical, intent(in) :: silent
  character(len=m) :: result

  integer :: ifail
  integer :: rank, size

  call mpi_init(ifail)

  call mpi_comm_rank(MPI_COMM_WORLD, rank, ifail)
  call mpi_comm_size(MPI_COMM_WORLD, size, ifail)

  ! Print the ID of the process and the total number of them
  write(result, '(a, i2, x, a, i2)') "Hello from rank", rank, "of", size
  if (.not. silent) write (0, *) trim(result)

  call mpi_finalize(ifail)
end function


end module HelloMpi
