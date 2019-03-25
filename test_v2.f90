module caller2_m
  implicit none
contains

  subroutine caller(callee)
    external :: callee
    call callee()
  end subroutine caller

end module caller2_m

!===============================================================================

module test2_m
  use caller2_m
  implicit none
  private
  public :: test, callee
contains

  subroutine test
    call caller(callee)
  end subroutine test

  subroutine callee
    print *, 'Greetings from "callee"!'
  end subroutine callee

end module test2_m

!===============================================================================

program test2
  use test2_m
  implicit none
  call test()
end program test2
