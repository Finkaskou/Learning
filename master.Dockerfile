FROM geerlingguy/docker-debian10-ansible

RUN apt-get update && apt-get install -y vim python net-tools telnet curl ssh sshpass