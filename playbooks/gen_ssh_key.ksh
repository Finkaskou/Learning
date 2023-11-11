#/bin/bash

mkdir ~/.ssh && cd ~/.ssh
ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""
cat id_rsa.pub > authorized_keys

for i in $(sed '1,2d;$d' /etc/ansible/inventory)
do 
	ssh root@${i} -c "mkdir .ssh"
	#scp ~/.ssh/authorized_keys root@${i}:~/.ssh
	ssh-copy-id -i ~/.ssh/authorized_keys root@${i}
done
