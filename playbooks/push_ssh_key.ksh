#/bin/bash

#mkdir ~/.ssh && cd ~/.ssh
#ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""
#cat id_rsa.pub > authorized_keys

for i in $(sed '1d' /etc/ansible/inventory)
do 
	echo "Serveur : ${i}"
	scp -o StrictHostKeyChecking=no ~/.ssh/authorized_keys root@${i}:~/.ssh/authorized_keys
	ssh-copy-id -i ~/.ssh/id_rsa.pub root@${i}
	echo ""
	echo ""
done

echo ""
echo ""

ansible -i /etc/ansible/inventory -m ping all