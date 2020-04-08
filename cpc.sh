#!/bin/bash
#CS1420 group 16 - cpc.sh shell script
echo
#Checks if the number of arguments is equal exactly to 3, or triggers a warning, reminder of use and exits the script
if [ ! $# = 3 ]; then
	echo "Error: incorrect number of arguments"
	echo
	echo "Usage: cpc [-cz] [source-file] [target-directory]"
	echo
	exit 1
else
	opt=$1
	src=$2
	tgt=$3
fi

#Checks whether the arguments of the variables are correct
arguments (){
#If the source file does not exist then print a warning and exit
if [ ! -e $src ]; then
	echo "The source file $src does not exist."
	echo
	exit 1
fi
#If the target directory does not exist then ask if the user would like to create the directory and continue, else exit
if [ ! -d $tgt ]; then
	echo "The target $tgt does not exist."
	echo
	read -p "Would you like to create a new directory at $tgt? [y / n] " nDir
	echo
	if [ $nDir == "y" ]; then 
		mkdir $tgt
		echo "Target directory $tgt has been created."
		echo
	else
		exit 1
	fi	
fi
}

#Copies the source file to the target directory
copy (){
cp $src $tgt
echo "Source file $src has been copied to directory $tgt."
echo
}

#Zips or unzips the source file into the target directory
zip (){
name=${src%.*}
ext=${src##*.}
#If the extension is not .gz, then zip the file into a .gz and place in the target directory
if [ $ext != "gz" ]; then
	gzip $src
	mv $src.gz $tgt
	echo "gzipped file $src has been created in directory $tgt."
	echo
#Else, if the file extension is .gz, then unzip the zipped contents into the target directory
else
	gunzip $src
	mv $name $tgt 
	echo "Source file $src has been uncompressed to directory $tgt."
	echo
fi
}

#If the first argument, the option is '-c', then run the copy function.
#Else, if the option argument is '-z', then run the zip function.
#Else, report an error and display correct usage of the script
case "$opt" in
	-c) 
		copy 
		;;
	-z)
		zip
		;;
	*)
		echo "Error: the first argument must be either '-c' or '-z'"
		echo
		echo "Usage: cpc [-cz] [source-file] [target-directory]"
		echo
		exit 1
		;;
esac
arguments
