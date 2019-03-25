module caller1_m
  implicit none
contains

  subroutine caller(callee)
    external :: callee
    call callee()
  end subroutine caller

end module caller1_m

!===============================================================================

program test1
  use caller1_m
  implicit none
  call caller(callee)

contains

  subroutine callee
    print *, 'Greetings from "callee"!'
  end subroutine callee

end program test1
