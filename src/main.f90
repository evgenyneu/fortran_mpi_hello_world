! Runs multiple programs in parallel using MPI
! (https://en.wikipedia.org/wiki/Message_Passing_Interface)
! Based on https://support.pawsey.org.au/documentation/display/US/Message+Passing+Interface
program hello

  use HelloMpi, only: hello_mpi
  use Constants, only: OUTPUT_LENGTH
  implicit none

  character(len=OUTPUT_LENGTH) :: result
  result = hello_mpi(silent=.false.)

end program hello
