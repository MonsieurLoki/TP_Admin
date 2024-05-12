#/bin/bash

set -e

docker login

cd ~/TP_Admin/l2-3/tp9.1/servicess

default_version="3.5"
version=${1:-"$default_version"}


docker build -t drapsag/woody_api_order:"$version" api_order
docker tag drapsag/woody_api_order:"$version" drapsag/woody_api_order:latest

docker build -t drapsag/woody_api_misc:"$version" api_misc
docker tag drapsag/woody_api_misc:"$version" drapsag/woody_api_misc:latest

docker build -t drapsag/woody_api:"$version" api 
docker tag drapsag/woody_api:"$version" drapsag/woody_api:latest

docker build -t drapsag/woody_reverse:"$version" reverse
docker tag drapsag/woody_reverse:"$version" drapsag/woody_reverse:latest

docker build -t drapsag/woody_db:"$version" db
docker tag drapsag/woody_db:"$version" drapsag/woody_db:latest

docker build -t drapsag/woody_front:"$version" front
docker tag drapsag/woody_front:"$version" drapsag/woody_front:latest


# avec le "set -e" du début, je suis assuré que rien ne sera pushé si un seul build ne c'est pas bien passé

docker push drapsag/woody_api_order:"$version"
docker push drapsag/woody_api_order:latest

docker push drapsag/woody_front:"$version"
docker push drapsag/woody_front:latest


docker push drapsag/woody_api_misc:"$version"
docker push drapsag/woody_api_misc:latest

docker push drapsag/woody_api:"$version"
docker push drapsag/woody_api:latest

docker push drapsag/woody_reverse:"$version"
docker push drapsag/woody_reverse:latest

docker push drapsag/woody_db:"$version"
docker push drapsag/woody_db:latest


