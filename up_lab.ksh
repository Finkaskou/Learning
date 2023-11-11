#/bin/bash

docker-compose up -d
docker exec -ti $(docker ps | grep learning_master_1 | cut -c1-4) /bin/bash

./gen_ssh_key.ksh