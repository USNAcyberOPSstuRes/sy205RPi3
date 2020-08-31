#!/usr/bin/env less

# Declare Required Variables
courseNum = sy205
commandsDefined = stat pull $(courseNum)StuStat $(courseNum)StuPull $(courseNum)StuRPi3Stat $(courseNum)StuRPi3Pull

projDir = ~/$(courseNum)Resources

.PHONY = $(commandsDefined)

default : $(courseNum)StuStat

stat : $(courseNum)StuStat

pull : $(courseNum)StuPull

$(courseNum)StuStat : $(courseNum)StuRPi3Stat

$(courseNum)StuPull : $(courseNum)StuRPi3Pull

$(courseNum)StuRPi3Stat :
	@printf "Student_RPi3> "
	@cd $(projDir) 2> /dev/null && git branch -v --list master | cut -d "r" -f "2" | cut -d " " -f 2

$(courseNum)StuRPi3Pull :
	@printf "Student_RPi3 (origin:master) pull> "
	@cd $(projDir) 2> /dev/null && git checkout -q master && git pull || echo FAILED
	$(MAKE) -f $(projDir)/genUtils/Makefile $(courseNum)StuRPi3Stat
