This repository tests a particular Fortran construct (in `test_v1.f90`) which
produces a binary file (`test_v1.x`) having its stack marked as executable.

To run:

1. Customize the `Makefile`.
2. Do `make`.
3. Test with `make check` to see if the stacks are marked as executable.
4. You can also force `ld` to make the stacks non executable. In this case,
   `make check` should segfault.
