module HelloMpiTest
use Types, only: dp
use AssertsTest, only: assert_equal
use HelloMpi, only: hello_mpi
use Constants, only: OUTPUT_LENGTH
implicit none
private
public hello_mpi_test_all

contains

subroutine hello_mpi_test(failures)
  integer, intent(inout) :: failures
  character(len=OUTPUT_LENGTH) :: result

  result = hello_mpi(silent=.true.)

  call assert_equal(result, "Hello from rank 0 of 1", &
    __FILE__, __LINE__, failures)
end


subroutine hello_mpi_test_all(failures)
  integer, intent(inout) :: failures

  call hello_mpi_test(failures)
end

end module HelloMpiTest
