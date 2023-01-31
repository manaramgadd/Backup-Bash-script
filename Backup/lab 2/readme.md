## OVERVIEW 
This code should automatically backup a directory (source )that the user choose and with every modification that occurs in the directory a new backup is inserted in a backup directory (destination)  that the user choose 
## THE CONTENTS OF THE FOLDER 
1-backup.sh: the bash script file that contains the bash commands inorder to execute a backup . 
backup.sh requires four argumnets :
1- The directory you want to back it up (Type :string)
2- The backup directory where you want your backups to be inserted in (Type :string)
3- The interval of time to wait between each check (in secs) (Type : numeric)
4- The maximun number of backup subdirectories inside the backup directory where if the number of subdirectorires exceed the maximum limit the oldest file will be replaced by the new backup subdirectory . (Type :numeric)
2- Makefile : the purpose of the makefile is to run the bash script and pass the argumnets .(backingup)
also it checks if the backup directory exists or not if it doesn't it creats a new one .(createdir)
##code :
the info of the dir you want to backup (var 1)is inserted in a file (directory_info.last) 
then we copy the sourc dir(var1) to the destination backup dir(var2)
then we enter an infinte loop
first thing first we check if the number of the subdirectories in the backupdir are exceeding the number of max backups (var4) [if the user runned the code and backed up a dir before ]it will delete the oldest backup subdirectory and replace i with the new one
wait (var3) between each check
now insert the source directory to a file (directory_info.new) 
compare between (directory_info.last) and  (directory_info.new) 
if the result is equal to 0 
then nothing changed 
if the result is not  equal to 0 
then directory changed 
copy the source directory to new backup dir
and copy the (directory_info.new) to (directory_info.last) 
##INSTALLATIONS 
install make : sudo apt install make
## USAGE
to run our code in order to backup the desired directory :
-open your terminal 
-type "make var1=name of the directory you want to backup var2=name of backup directory var3=secs you want to wait between each check var4=maximun number of backups" 
-a message "backing up.. " will be printed
-at the very begining when the code runs at the backup dir a new backup subdirectory will be created containg the files of the dir you want to backup
-"nothing changed " will appear as long as you didn't modify anything
-"directory changed " will apear when you modify the dir and a new backup subdirectory will be created in the backup dir
-if you want to terminate simply go to the terminal and press ctrl+z

 

