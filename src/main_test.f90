program MainTest
    use HelloMpiTest, only: hello_mpi_test_all
    implicit none

    integer :: failures = 0
    character(len=1024) :: test_word = "TESTS"

    call hello_mpi_test_all(failures)

    if (failures == 0) then
        print *, NEW_LINE('h')//'Tests finished successfully'
    else
        if (failures == 1) then
            test_word = "TEST"
        end if

        print '(a, i4, x, a, x, a)', NEW_LINE('h'), failures, &
              trim(test_word), 'FAILED'

        call exit(42)
    end if
end program MainTest
