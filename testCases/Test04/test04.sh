#!/bin/bash
. ../../pass_fail.sh

CWD=$(pwd)
didSimulationDiffAnywhere=0

if [ -f $CWD/PASS ]; then
    # already ran this test
    didSimulationDiffAnywhere=0
else
    if [ "${COMPILER}" == 'intelPhi' ] ; then
	ssh `hostname`-mic0 "cd $PWD; source ../../../../phi.env; mpirun -np 4 $cFAST &> log.Test04"
    else
	mpirun -np 4 $cFAST &> log.Test04
    fi
    cat turbineAlloc.0.txt turbineAlloc.1.txt turbineAlloc.2.txt turbineAlloc.3.txt >> log.Test04
    diff log.Test04 log.Test04.gold &> /dev/null
    didSimulationDiffAnywhere="$?"
fi

# write the file based on final status
if [ "$didSimulationDiffAnywhere" -gt 0 ]; then
    PASS_STATUS=0
else
    PASS_STATUS=1
    echo $PASS_STATUS > PASS
fi

# report it; 30 spaces
if [ $PASS_STATUS -ne 1 ]; then
    echo -e "..Test04................ FAILED"
else
    echo -e "..Test04................ PASSED"
fi

exit
