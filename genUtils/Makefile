#!/usr/bin/env less

# Declare Required Variables
courseNum = sy205
commandsDefined = $(courseNum)StuStat $(courseNum)StuPi3Stat

projDir = ~/$(courseNum)Resources

.PHONY = $(commandsDefined)

default : $(courseNum)StuStat

$(courseNum)StuStat : $(courseNum)StuPi3Stat

$(courseNum)StuPull : $(courseNum)StuPi3Pull

$(courseNum)StuPi3Stat :
	@printf "Student_RPi3> "
	@cd $(projDir) 2> /dev/null && git branch -v --list master | cut -d "r" -f "2" | cut -d " " -f 2

$(courseNum)StuPi3Pull :
	@printf "Student_RPi3 (origin:master) pull> "
	@cd $(projDir)2> /dev/null && git checkout -q master && git pull || echo FAILED
