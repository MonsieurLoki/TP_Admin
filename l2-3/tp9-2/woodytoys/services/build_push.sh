#/bin/bash

set -e

default_version="3"
version=${1:-"$default_version"}


docker build -t drapsag/woody_api:"$version" api 
docker tag drapsag/woody_api:"$version" drapsag/woody_api:latest

docker build -t drapsag/woody_rp:"$version" reverse
docker tag drapsag/woody_rp:"$version" drapsag/woody_rp:latest

docker build -t drapsag/woody_db:"$version" database
docker tag drapsag/woody_db:"$version" drapsag/woody_db:latest

docker build -t drapsag/woody_front:"$version" front
docker tag drapsag/woody_front:"$version" drapsag/woody_front:latest


# avec le "set -e" du début, je suis assuré que rien ne sera pushé si un seul build ne c'est pas bien passé

docker push drapsag/woody_api:"$version"
docker push drapsag/woody_api:latest

docker push drapsag/woody_rp:"$version"
docker push drapsag/woody_rp:latest

docker push drapsag/woody_front:"$version"
docker push drapsag/woody_front:latest

docker push drapsag/woody_db:"$version"
docker push drapsag/woody_db:latest
