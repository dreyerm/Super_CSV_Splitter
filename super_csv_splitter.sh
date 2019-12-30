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

# Receive directory location input from user and store it in the FILEPATH variable
read -e -p "Directory: " FILEPATH
echo
echo "The filepath you have entered is: $FILEPATH"
echo

# Check if the filepath exists, if it does not, call getFilePath function again
if [ ! -d $FILEPATH ];
	then echo "$FILEPATH DOES NOT EXIST!"
		 echo "Please check it and enter again!"
		 echo
		 echo
getFilePath
fi
}

# Call the function to get the filepath
getFilePath

# Change the directory to the whatever got stored in the FILEPATH variable
cd $FILEPATH
echo "Directry changed to $FILEPATH ..."
echo
echo --------------------------------------------------------
echo


# Declare the function that gets the file name
getFileName() {
echo "2. Please enter the filename of the file you wish to split!"
echo

# Receive the filename input from user and store it in the FILENAME variable
read -e -p "Filename: " FILENAME
echo
echo "The filename you have provided is: $FILENAME"
echo

# Check if filename exists, if it does not, call getFileName function again
if [ ! -e $FILENAME ]
	then echo "$FILENAME DOES NOT EXIST!"
         echo "Please check it and enter again!"
         echo
         echo
getFileName
fi
}

# Call the function to get the filename
getFileName

echo "Checking the number of lines of your current file, please wait ..."
echo

# Check current amount of lines in file
NUMOFLINES=$(wc -l < $FILENAME)
echo "Checking the filesize of your current file, please wait ..."
echo
echo --------------------------------------------------------

# Check size of file in human readable format and assign to a variable called SIZEOFFILE
SIZEOFFILE=$(ls -lah $FILENAME | awk '{ print $5}')
echo
echo "Currently, $FILENAME has:"
echo
echo "*** $NUMOFLINES of lines"
echo "*** $SIZEOFFILE of MegaBytes"
echo
echo --------------------------------------------------------
echo

# Declare the function that gets the filename prefix
getPrefix(){
echo "3. What would you like to prefix your filenames with?: "
echo
read -e -p "Prefix: " PREFIX
echo
echo "The prefix you have entered is: $PREFIX"
read -e -p "Are you sure this is correct? Please answer with y/n: " REPLY1
echo
if [[ "$REPLY1" =~ ^[Yy]$ ]]
then
	getLineCount
else
	getPrefix
fi
}

# Call the function to get the prefix
getPrefix
echo

# Declare the function that gets the line count
getLineCount(){
echo --------------------------------------------------------
echo
echo "4. Please provide the amount of lines you wish the chunks to be!"
echo

# Receive the linecount input from user and store it in the LINECOUNT variable
read -e -p 'Amount of lines: ' LINECOUNT
echo
echo The amount of lines you have provided is: $LINECOUNT
read -e -p "Are you sure this is the correct amount? Please answer with y/n: " REPLY2
echo

# If answered with Y or y, execute the script.
if [[ "$REPLY2" =~ ^[Yy]$ ]]
then
	echo
	echo
	echo
	echo Executing script ...
	HDR=$(head -1 $FILENAME)
	split -l $LINECOUNT $FILENAME xyz
	n=1
	for f in xyz*
	do
     if [ $n -gt 1 ]; then 
          echo $HDR > $PREFIX${n}.csv
     fi
     cat $f >> $PREFIX${n}.csv
     rm $f
     ((n++))
done
else
	getLineCount
fi
}
echo
echo
echo Split completed! Please check your $FILEPATH directory for the output!