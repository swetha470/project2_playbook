#!/bin/bash

userlist=/tmp/userlist.txt

usernames=$(cat /tmp/userlist.txt | tr 'A-Z' 'a-z')

password=default_pass@12345

for username in $usernames
do
    useradd $username
    echo $password | passwd --stdin $username
done

tail -6 /etc/passwd