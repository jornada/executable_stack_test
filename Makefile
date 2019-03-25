F90 = ifort
LD = ifort
#LD = ifort -Wl,-z,noexecstack
#F90 = gfortran
#LD = gfortran
#LD = gfortran -Wl,-z,noexecstack
STACK_CHECK = execstack -q


all: test_v1.x test_v2.x

%.x: %.o
	$(LD) -o $@ $^

%.o: %.f90
	$(F90) -c $^

clean:
	rm -rf *.x *.o *.mod

check%: test_v%.x
	@echo "Checking if stack is executable in $^"
	$(STACK_CHECK) $^
	@echo "Testing app $^"
	./$^

check: check1 check2

.PHONY: clean check%
