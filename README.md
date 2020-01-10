# Super_CSV_Splitter
A simple CSV splitter for terminal

This is a simple tool for UNIX based terminals that can split large CSV files into smaller CSV files.
It currently has the following options available:

* Script supports entering a custom filepath, or using your current working directory (for when you wish to make the script an alias)
* Script supports checking if the entered directory exists or not
* Script supports checking if the entered filename of the file to split, exists or not
* Script supports checking and returning the current line count of the file
* Script supports checking and returning the current file size of the file
* Script supports prefixing the newly generated files with what you want the new files to be called
* Script supports splitting the file by line count (file size is coming soon)

# How to install

1. Open terminal
2. Go to directory of your choice, where you wish to store the script
3. Using vim or nano, create a new file and paste the code in terminal
4. Save file as: scriptname.sh
5. Execute script by typing: ```. ./scriptname.sh```  OR  by typing: ```source ./scriptname.sh```

You can also create an alias if this is easier, by typing:

```alias commandname="source /location/scriptname.sh"```

For example:

```alias csvsplit="source /home/mobaxterm/Desktop/sample/split.sh"```

When now typing ```csvsplit``` , it will automatically execute the script.

To make the alias permanent, please enter:

```sudo vim ~/.bash_profile```<br/>
Enter your password<br/>
```#My custom aliases```<br/>
```alias commandname="source ~/location/scriptname.sh"```<br/>

Restart terminal for the alias to take effect. Obviously replace the example above with what works best for you.

An example:

1. I started terminal <br/>
2. I am now in my main home directory: ```LON010068:~ mdreyer$``` <br/>
3. I created a new directory and called it bash_scripts: ```mkdir bash_scripts```<br/>
4. I navigated to the new directory: ```cd bash_scripts```<br/>
5. I create the script file: ```vim super_csv_splitter.sh``` or ```nano super_csv_splitter.sh```<br/>
6. I paste the entire code of the script in the terminal, and save the file<br/>
7. I open my bash_profile: ```sudo ~/.bash_profile```<br/>
8. I enter my password<br/>
9. I add a comment that indicates what is going to follow, are my custom aliases: ```# My Custom Aliases```<br/>
10. I add the following line: ```alias csvsplitter="source ~/.bash_scripts/super_csv_splitter.sh```<br/>
11. I save the file<br/>
12. I exit terminal and restart terminal<br/>
13. If I now simply type: ```csvsplitter``` , regardless which working directory I am in, the script will start
