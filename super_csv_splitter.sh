#!/bin/bash

# Start the interface!


echo "   _____                          ____________    __";
echo "  / ___/__  ______  ___  _____   / ____/ ___/ |  / /";
echo "  \__ \/ / / / __ \/ _ \/ ___/  / /    \__ \| | / / ";
echo " ___/ / /_/ / /_/ /  __/ /     / /___ ___/ /| |/ /  ";
echo "/____/\__,_/ .___/\___/_/      \____//____/ |___/   ";
echo "       ___///      ___ __  __                       ";
echo "      / ___/____  / (_) /_/ /____  _____            ";
echo "      \__ \/ __ \/ / / __/ __/ _ \/ ___/            ";
echo "     ___/ / /_/ / / / /_/ /_/  __/ /                ";
echo "    /____/ .___/_/_/\__/\__/\___/_/                 ";
echo "        /_/                                         ";
echo
echo
echo

# Declare the function that gets the file path
getFilePath() {
echo "1. Please enter the directory location!"
echo
read -e -p "Directory: " FILEPATH
echo
echo "The filepath you have entered is: $FILEPATH"
echo
read -e -p  "Is the filepath correct? Please answer with y/n: "
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
cd $FILEPATH
echo "Directry changed to $FILEPATH ..."
echo --------------------------------------------------------
echo
else
		getFilePath
fi
}

# Call the function to get the filepath
getFilePath


# Declare the function that gets the file name
getFileName() {
echo "2. Please enter the filename of the file you wish to split!"
echo
read -e -p 'Filename: ' FILENAME
echo
echo "The filename you have provided is: $FILENAME"
echo
# Check if filename exists, if it does not, call getFileName function again
if [ ! -e $FILENAME ]
	then echo "$FILENAME DOES NOT EXIST!"
         echo "Please check it and re-enter!"
         echo
         echo
getFileName
fi
}

# Call the function to get the filename
getFileName
echo "Checking the number of lines of your current file, please wait ..."
echo
#Check current amount of lines in file
NUMOFLINES=$(wc -l < $FILENAME)

# Declare the function that gets the line count
getLineCount(){

echo "Currently, $FILENAME has: $NUMOFLINES of lines"
echo
echo "Please provide the amount of lines you wish the chunks to be!"
echo
read -e -p 'Amount of lines: ' LINECOUNT
echo
echo The amount of lines you have provided is: $LINECOUNT
echo
read -e -p "Are you sure this is the correct amount? Please answer with y/n: "
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo
	echo Executing script ...
	HDR=$(head -1 $FILENAME)
	split -l $LINECOUNT $FILENAME xyz
	n=1
	for f in xyz*
	do
     if [ $n -gt 1 ]; then 
          echo $HDR > Part${n}.csv
     fi
     cat $f >> Part${n}.csv
     rm $f
     ((n++))
done
else
	getLineCount
fi
}
getLineCount
echo
echo
echo Split completed! Please check your $FILEPATH directory for the output!