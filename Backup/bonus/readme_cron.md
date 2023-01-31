## OVERVIEW 
This code should automatically backup a directory (source )that the user choose and with every modification that occurs in the directory a new backup is inserted in a backup directory (destination)  that the user choose using cron job.
## THE CONTENTS OF THE FOLDER 
1-backup_cron.sh: the bash script file that contains the bash commands inorder to execute a backup . 
backup.sh requires four argumnets :
1- The directory you want to back it up (Type :string)
2- The backup directory where you want your backups to be inserted in (Type :string)
3- The maximun number of backup subdirectories inside the backup directory where if the number of subdirectorires exceed the maximum limit the oldest file will be replaced by the new backup subdirectory . (Type :numeric)
##code :
the info of the dir you want to backup (var 1)is inserted in a file (directory_info.last) 
first thing first we check if the number of the subdirectories in the backupdir are exceeding the number of max backups (var4) [if the user run the code and backed up a dir before ]it will delete the oldest backup subdirectory and replace i with the new one
compare between (directory_info.last) and  (directory_info.new)
if the result is equal to 0 
then nothing changed 
if the result is not  equal to 0 
then directory changed 
now insert the source directory to a file (directory_info.new) 
copy the source directory to new backup dir
and copy the (directory_info.new) to (directory_info.last) 
##INSTALLATIONS 
TO install cron  
go to the terminal and type :sudo apt install cron
## USAGE
to run our code in order to backup the desired directory :
-open your terminal 
-type "crontab -e" 
-then another terminal will open write the time you want the backup to occur every time I made it check very 1 miniute (*/1 * * * *  /home/manar/backup_cron.sh "dir" "backkupp" "5" )
-type the arguments inside crontab 
-save and exit ctrl+x
-"installing new crontab " will apear at your terminal
-then go to the backup directory and check it out .
 

