#!/bin/bash
#script used for reg testing
COMPILER="../compiler"
COMPFILE="temp_test"

for TESTFILE in ../test/*.n2n;
do
 	echo "	TESTING $TESTFILE"
	LEN=$((${#TESTFILE}-3))
	OUTFILENAME="${TESTFILE:0:$LEN}.output"
	TESTFILENAME="${TESTFILE:0:$LEN}.out"
	"$COMPILER" < "$TESTFILE"
	javac output.java -o "$COMPFILE"
	./"$COMPFILE" > "$OUTFILENAME"
	if (diff "$OUTFILENAME" "$TESTFILENAME")
	then
		echo "		OK"
	else
		echo "		BAD!"
	fi
	rm "$OUTFILENAME" output.java "$COMPFILE"
done
