#!/usr/bin/env less

# Declare Required Variables
courseNum = sy205
commandsDefined = stat pull $(courseNum)StuStat $(courseNum)StuPull $(courseNum)StuSysStat $(courseNum)StuSysPull

projDir = ~/$(courseNum)Resources

.PHONY = $(commandsDefined)

default : $(courseNum)StuStat

stat : $(courseNum)StuStat

pull : $(courseNum)StuPull

$(courseNum)StuStat : $(courseNum)StuSysStat

$(courseNum)StuPull : $(courseNum)StuSysPull

$(courseNum)StuSysStat :
	@printf "Student_System> "
	@cd $(projDir) 2> /dev/null && git branch -v --list master | cut -d "r" -f "2" | cut -d " " -f 2

$(courseNum)StuSysPull :
	@printf "Student_System (origin:master) pull> "
	@cd $(projDir) 2> /dev/null && git checkout -q master && git pull || echo FAILED
	@$(MAKE) -s -f $(projDir)/genUtils/Makefile $(courseNum)StuSysStat
