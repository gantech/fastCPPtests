#!/bin/bash

#Set these variables
FAST_DIR=/home/gvijayak/nalu-gcc-5.2.0/packages/fastv8DriverProgram/fastv8/
export nativeFAST=FAST_glin64_debug
export cFAST=FAST_ProgC_glin64_debug



echo "Rtest Begin: " 
testDir=$(pwd)
runTestDir=$testDir/runTest/

# create the directory in which the tests will be run (if it does not exist)
if [ ! -d "$runTestDir" ]; then
    mkdir $runTestDir
fi

# now check for testCases
if [ ! -d "$runTestDir/testCases" ]; then
    mkdir $runTestDir/testCases
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${FAST_DIR}/lib/
export PATH=$PATH:${FAST_DIR}/bin/

# copy pass_fail script
cp ${testDir}/pass_fail.sh $runTestDir
cp ${testDir}/*py $runTestDir


cp -r ${testDir}/5MW_Baseline $runTestDir

#=============================================================================
# Test 01
#=============================================================================
if [ ! -d "${runTestDir}/testCases/Test01" ]; then
    mkdir ${runTestDir}/testCases/Test01
fi

cd ${runTestDir}/testCases/Test01
cp ${testDir}/testCases/Test01/makefile_DISCON_DLL ${runTestDir}/testCases/Test01/
cp ${testDir}/testCases/Test01/Test01.fst ${runTestDir}/testCases/Test01/
cp ${testDir}/testCases/Test01/cDriver.i* ${runTestDir}/testCases/Test01/
cp ${testDir}/testCases/Test01/5MW_Baseline ${runTestDir}/testCases/Test01/ -r
cp ${testDir}/testCases/Test01/test01.sh ${runTestDir}/testCases/Test01/
# run it...  
./test01.sh

#=============================================================================
# Test 02
#=============================================================================
if [ ! -d "${runTestDir}/testCases/Test02" ]; then
    mkdir ${runTestDir}/testCases/Test02
fi

cd ${runTestDir}/testCases/Test02
cp ${testDir}/testCases/Test02/makefile_DISCON_DLL ${runTestDir}/testCases/Test02/
cp ${testDir}/testCases/Test02/Test02.fst ${runTestDir}/testCases/Test02/
cp ${testDir}/testCases/Test02/cDriver.i* ${runTestDir}/testCases/Test02/
cp ${testDir}/testCases/Test02/5MW_Baseline/ ${runTestDir}/testCases/Test02/ -r
cp ${testDir}/testCases/Test02/test02.sh ${runTestDir}/testCases/Test02/
# run it...  
./test02.sh

#=============================================================================
# Test 03
#=============================================================================
if [ ! -d "${runTestDir}/testCases/Test03" ]; then
    mkdir ${runTestDir}/testCases/Test03
fi

cd ${runTestDir}/testCases/Test03
cp ${testDir}/testCases/Test03/makefile_DISCON_DLL ${runTestDir}/testCases/Test03/
cp ${testDir}/testCases/Test03/t*Test03.fst ${runTestDir}/testCases/Test03/
cp ${testDir}/testCases/Test03/cDriver.i* ${runTestDir}/testCases/Test03/
cp ${testDir}/testCases/Test03/5MW_Baseline/ ${runTestDir}/testCases/Test03/ -r
cp ${testDir}/testCases/Test03/test03.sh ${runTestDir}/testCases/Test03/
# run it...  
./test03.sh


#=============================================================================
# Test 04
#=============================================================================
if [ ! -d "${runTestDir}/testCases/Test04" ]; then
    mkdir ${runTestDir}/testCases/Test04
fi

cd ${runTestDir}/testCases/Test04
cp ${testDir}/testCases/Test04/cDriver.i ${runTestDir}/testCases/Test04/
cp ${testDir}/testCases/Test04/test04.sh ${runTestDir}/testCases/Test04/
cp ${testDir}/testCases/Test04/log.Test04.gold ${runTestDir}/testCases/Test04/
# run it...  
./test04.sh


#=============================================================================
# Test 05
#=============================================================================
if [ ! -d "${runTestDir}/testCases/Test05" ]; then
    mkdir ${runTestDir}/testCases/Test05
fi

cd ${runTestDir}/testCases/Test05
cp ${testDir}/testCases/Test05/makefile_DISCON_DLL ${runTestDir}/testCases/Test05/
cp ${testDir}/testCases/Test05/t*Test05.fst ${runTestDir}/testCases/Test05/
cp ${testDir}/testCases/Test05/cDriver.i* ${runTestDir}/testCases/Test05/
cp ${testDir}/testCases/Test05/5MW_Baseline ${runTestDir}/testCases/Test05/ -r
cp ${testDir}/testCases/Test05/test05.sh ${runTestDir}/testCases/Test05/
# run it...  
./test05.sh


echo "Rtest End"



