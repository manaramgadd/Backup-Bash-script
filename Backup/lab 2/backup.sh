#! /bin/bash
if [ $# -eq 4 ]
then
date +'%Y/%m/%d/%H/%M/%S'
echo "directory to backup:"$1
if [ -d $1 ] #checking if the dir exists
then
echo "backup directory :"$2
if [ -d $2 ] #checking if the dir exists
then
echo "secs to wait between each check :"$3 
if ! [[ "$3" =~  ^[0-9]+$ ]] ; #checking if parameter 3 is interger or not
then exec >&2; echo "error its not a number!"; exit 1
fi
if ! [[ "$4" =~  ^[0-9]+$ ]] ; #checking if parameter 4 is interger or not
then exec >&2; echo "error its not a number!"; exit 1
fi
echo "maximun number of backups:"$4
else 
echo "wrong backup directory"
fi
else
echo "wrong directory"
fi
echo "Backing up.."
touch directory_info.last 
touch directory_info.new
ls -lR $1 > directory_info.last
cp -R $1 $2/backupdir_$(date +"%Y-%m-%d-%H-%M-%s")
while [ 1 ] 
do
cd $2/
if [ $( find . -mindepth 1  -type d | wc -l ) -gt $4 ]
then
rm -r $(ls -tr . | head -1)
fi
cd ..
sleep $3
ls -lR $1 > directory_info.new
diff directory_info.last directory_info.new
if [ $? -ne 0 ] 
then
cp -R $1 $2/backupdir_$(date +"%Y-%m-%d-%H-%M-%s")
echo "directory changed"
cp -R directory_info.new directory_info.last
else 
echo "nothing changed"
fi 
done
else
echo "wrong number of parameters"
fi
