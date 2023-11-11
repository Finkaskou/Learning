#/bin/bash

cd ~/.ssh
ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""
cat id_rsa.pub > authorized_keys

for i in $(cat /etc/ansible/inventory)
do 
	ssh root@${i}
	mkdir .ssh
	exit 
    scp ~/.ssh/authorized_keys root@${i}:~/.ssh
done