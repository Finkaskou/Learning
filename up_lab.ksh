#/bin/bash

docker-compose up -d
docker-compose scale web=2
docker exec -ti $(docker ps | grep learning_master_1 | cut -c1-4) /bin/bash
