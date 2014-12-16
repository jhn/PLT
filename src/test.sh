#!/bin/bash

rm -f ../test/sem_output/*.out
echo 

arg_array=( $@ )
test_instruction=${arg_array[0]}
test_message=""
test_output=""
for (( i = 1; i < $#; i++))
do
if [[ $test_instruction == "ast" ]]
then
	test_message="Printing ast for ${arg_array[$i]}: "
	test_output=$(./n2n -a ${arg_array[i]} 2>&1)
elif [[ $test_instruction == "semantic_check" ]]
then
	test_message="Checking semantic_check for ${arg_array[$i]}: "
	test_output=$(./n2n -s ${arg_array[$i]} 2>&1)
elif [[ $test_instruction == "java" ]]
then 
	test_message="Generating java code for ${arg_array[$i]}: "
	if [[ ${arg_array[$i+1]} == *".java" ]]
	then
		test_output=$(./n2n -j ${arg_array[$i]} ${arg_array[$++i]} 2>&1)
	else
		test_output=$(./n2n -j ${arg_array[$i]} 2>&1)
	fi
fi
if [[ $test_output == *"Parse_error"* ]]
then 
	echo $test_message"Failed Parsing"
	echo 
elif [[ $test_instruction != "ast" && $test_output != *"Passed Semantic Analysis"* ]]
then
	filename=${arg_array[$i]}
	back_filename=${filename##*/}
	echo $test_message"Failed Semantic Check. Output in file ../test/sem_output/${back_filename%.*}.out"
	echo
	printf "$test_output" > ../test/sem_output/${back_filename%.*}.out
else
	if [[ $test_instruction == "ast" ]]
	then
	echo $test_message"Passed."
	echo
	printf "$test_output\n"
	echo
	else 
	echo $test_message"Passed."
	echo
	fi
fi
done
