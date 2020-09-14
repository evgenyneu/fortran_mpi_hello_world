module HelloMpiTest
use Types, only: dp
use AssertsTest, only: assert_true
use HelloMpi, only: hello_mpi
implicit none
private
public hello_mpi_test_all

contains

subroutine hello_mpi_test(failures)
  integer, intent(inout) :: failures
  logical :: result

  result = hello_mpi()

  call assert_true(result, __FILE__, __LINE__, failures)
end


subroutine hello_mpi_test_all(failures)
  integer, intent(inout) :: failures

  call hello_mpi_test(failures)
end

end module HelloMpiTest
