-- docker stack ------------------------------

# docker swarm leave -f
# docker swarm init

docker node ls
docker node inspect vps-79ed7e90
docker node inspect vps-79ed7e90 | jq -r '.[0].Status.Addr'

vps-79ed7e90 54.37.13.182
vps-Gaspard  54.37.13.151
vps-15225ca6 54.37.12.55

vps-d4894e76 54.37.15.123

watch nmap -p 2377,2376,2375,4789,7946 54.37.13.182

function getCont() {
    echo mystack_$1.1.$(docker stack ps mystack --no-trunc | grep "mystack_$1.1" | grep -i running | cut -d' ' -f1)
}
getCont front

trim () 
{ 
    trimmed=$1;
    trimmed="${trimmed#"${trimmed%%[![:space:]]*}"}";
    trimmed="${trimmed%"${trimmed##*[![:space:]]}"}";
    echo "$trimmed"
}

# rebuild all image

cd ~/TP_Admin/l2-3/tp9.1/services
bash build_push.sh
docker stack deploy -c docker-compose.yml mystack
docker logs $(getCont api_order) 
docker logs $(getCont api)


docker stack ls
docker stack ps mystack --filter "desired-state=running"



docker exec -ti $(getCont rabbitmq)  rabbitmqctl list_queues

watch docker stack ps mystack

docker stack rm mystack
docker stack services mystack
docker service ps --format '{{.ID}} {{.Name}}  {{.Image}}' --no-trunc --filter "desired-state=running" mystack_api

docker node update --availability drain vps-Gaspard
docker node update --availability active vps-Gaspard
docker node update --availability drain vps-15225ca6
docker node update --availability active vps-15225ca6

docker node update --availability active vps-15225ca6

docker node update --availability drain vps-d4894e76

function getCont() {
    echo mystack_$1.1.$(docker stack ps mystack --no-trunc | grep "mystack_$1.1" | grep -i running | cut -d' ' -f1)
}
getCont front

docker logs $(getCont reverse)
docker logs $(getCont database)
docker logs $(getCont api)

docker service ps mystack_api

docker exec -ti $(getCont db)  mysql -u root -ppass 
docker exec -ti $(getCont api)  curl localhost:5000/api/ping && echo ""
docker exec -ti $(getCont api_misc)  curl localhost:5000/api/misc/time && echo ""
docker exec -ti $(getCont api)  curl localhost:5000/api/misc/heavy && echo ""
docker exec -ti $(getCont api)  curl localhost:5000/api/misc/heavy?name=stock-ml && echo ""
docker exec -ti $(getCont api)  curl localhost:5000/api/products/last && echo ""

docker exec -ti $(getCont api)  curl localhost:5000/api/orders?order_id=c875167a-a2bd-4ad2-b6a2-11aac0d6e179  && echo ""


# docker exec -ti $(getCont api)  curl localhost:5000/api/products && echo ""
# docker exec -ti $(getCont api) curl localhost:5000/api/fast && echo ""
# docker exec -ti $(getCont api)  curl -X POST -d "<data>" localhost:5000/api/database && echo ""


apt update && apt install -y nano net-tools iputils-ping curl iproute2 htop vim

docker service ps --format '{{.ID}} {{.Name}}  {{.Image}} {{.Node}}' \
        --no-trunc --filter "desired-state=running" \
        mystack_front | while read -r line; do
        container_id=$(echo $line | cut -d' ' -f1)
        ipaddr=$(docker inspect $container_id | grep -i addresses -A 1 | grep -i -v Addresses)
        name=$(echo $line | cut -d' ' -f2)
        image=$(echo $line | cut -d' ' -f3)
        node=$(echo $line | cut -d' ' -f4)
        echo "  Container ID: $name.$container_id  ($node) ($(trim $ipaddr))"
    done

docker service scale mystack_db=3
docker service scale mystack_api=3
docker service scale mystack_front=3
docker service scale mystack_reverse=3
docker service scale mystack_redis=1
docker service scale mystack_rabbitmq=1

docker stack ps mystack -f "desired-state=running"


# RabbitMQ -----------------------------------------------------------------------

sudo apt install -y rabbitmq-server
sudo service rabbitmq-server start
sudo rabbitmq-plugins enable rabbitmq_management # plugins for web management
http://localhost:15672/
guest/guest

# cli
sudo rabbitmqctl list_queues


docker exec -ti $(getCont rabbitmq)  rabbitmqctl list_queues


sudo service rabbitmq-server stop
Timeout: 60.0 seconds ...
Listing queues for vhost / ...
name    messages
woody_order_queue       3


python -m pip install pika --upgrade

