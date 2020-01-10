#!/bin/bash
clear;


if ! [ -f .phonebookDB.txt ]; then

touch .phonebookDB.txt


fi



case $1 in 

-i) 
  echo  "Insert new contact name and number " 
  read -p "enter the name  " name
  read -p "enter the phone number  " number

  echo -n $name >> .phonebookDB.txt
  echo -e " "$number >> .phonebookDB.txt;;

-v) 
 echo  "View all contacts details "
 cat .phonebookDB.txt;;

-s)
echo "Search by contact name "
 read -p "enter the name to search " searchname

cn=$(grep -ci -w "$searchname" .phonebookDB.txt)

if [ "$cn" != "0" ]; then 

  grep $searchname .phonebookDB.txt

else 

 echo "not found" 


fi

;;

-e)
>.phonebookDB.txt 
;;


-d)
read -p "enter contact to delete  " key
sed -i -e  "/\<$key\>/d" .phonebookDB.txt
;;

*)
echo "Insert new contact name and number, with the option "-i" "
echo "View all saved contacts details, with the option "-v""
echo "Search by contact name, with the option "-s" "
echo "Delete all records, with "-e""
echo "Delete only one contact name, with "-d""





esac



