#!/bin/bash

# set your path here
DOCKER_PRODUCTION="testing_container"
SERVER_LOCATION="/home/gamer/website/testing"

sudo cp -r * $SERVER_LOCATION


if [ $(sudo docker container ls -a --format '{{.Names}}' | grep $DOCKER_PRODUCTION) ]; then
sudo docker start $DOCKER_PRODUCTION
echo "launched existing container"

elif [ $(sudo docker container ps --format '{{.Names}}' | grep $DOCKER_PRODUCTION) ]; then
sudo docker run -tv $SERVER_LOCATION:/usr/local/apache2/htdocs --name $DOCKER_PRODUCTION httpd;
echo "Created and launched container successfully"

else
echo "Files updated"
fi;
