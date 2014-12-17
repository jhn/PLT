#!/bin/bash

COMPILER="../n2n -c"
TESTFILES=$@

rm errors.out

for f in $TESTFILES
do
	LEN=$((${#f}-4))
	OUTFILENAME="${f:0:$LEN}.output"
	TESTFILENAME="${f:0:$LEN}.out"
  echo -n "Test $f: "
	$COMPILER $f > $OUTFILENAME 2>> errors.out

  DIFF=$(diff -w $OUTFILENAME $TESTFILENAME)
  if [ "$DIFF" == "" ]
	then
		echo " OK"
	else
		echo " FAIL"
    echo "========"
    echo "Expected:"
    echo "$(cat ${TESTFILENAME})"
    echo "========"
    echo "But was:"
    echo "$(cat ${OUTFILENAME})"
	fi

  rm -f $OUTFILENAME
done
