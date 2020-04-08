#!/bin/bash
#CS1420 group 16 - evenfruit.sh shell script
#If there are no parameters entered from the console then read two parameters here
if [ $# = 0 ]; then 
	read -p "Missing both parameters. Please enter two integers separated by a space: " n1 n2
#Else if there is no second parameter then read a second parameter here
elif [ -z $2 ]; then
	n1=$1
	read -p "Missing second parameter. Please enter one integer as the second: " n2
#Else if there are exactly 2 parameters continue as normal
elif [ $# = 2 ]; then
	n1=$1
	n2=$2
#Else assume there are too many parameters, only use the first two given
else
	n1=$1
	n2=$2
	echo -n "Warning: you have entered more than two parameters. Only the first two will be used."
fi

#for every value between the first and second parameters
for i in `seq $n1 $n2`; do 
	#divide the current iteration by 2, 7, 11 and 13, and set variables to each result
	even=$(( $i % 2 ))
	seven=$(( $i % 7 ))
	eleven=$(( $i % 11 ))
	thirteen=$(( $i % 13 ))
	
	#check if the current iteration is both even and exactly divisible by either 7, 11 or 13
	#and print that iteration followed by a specific fruit if it is
	if [ $seven -eq 0 ] && [ $even -eq 0 ]; then
		echo "$i:orange"
	elif [ $eleven -eq 0 ] && [ $even -eq 0 ]; then
		echo "$i:banana"
	elif [ $thirteen -eq 0 ] && [ $even -eq 0 ]; then
		echo "$i:pear"
	elif [ $even -eq 0 ]; then
		echo $i
	fi
done
echo
echo "What is with the fruit obsession?"


