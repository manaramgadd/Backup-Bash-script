#! /bin/bash
mkdir -p $2
if [ -d $1 ] #checking if the dir exists
then
if [ -d $2 ] #checking if the dir exists
then
if ! [[ "$3" =~  ^[0-9]+$ ]] ; #checking if parameter 3 is interger or not
then exec >&2; echo "error its not a number!"; exit 1
fi
touch /home/manar/directory_info.last
touch /home/manar/directory_info.new 
ls -lR /home/manar/$1 > /home/manar/directory_info.last
diff /home/manar/directory_info.last /home/manar/directory_info.new
if [ $? -ne 0 ] 
then
cp -R /home/manar/$1  /home/manar/$2/backupdir_$(date +"%Y-%m-%d-%H-%M-%s")
echo "directory changed"
ls -lR /home/manar/$1 > /home/manar/directory_info.new 
cp -R /home/manar/directory_info.new /home/manar/directory_info.last
else 
echo "nothing changed"
fi 
cd $2/
if [ $( find . -mindepth 1  -type d | wc -l ) -gt $3 ]
then
rm -r $(ls -tr . | head -1)
fi
cd ..
fi
fi
