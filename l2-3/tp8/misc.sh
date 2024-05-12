docker service create --name web -p 8080:80 --replicas 3 drapsag/mon-nginx:1.1

docker swarm join --token SWMTKN-1-2vv3t49fiz7vb1tq02351pkyzqz1jkwz5y2u9hpupi5ciz94dy-dr1qehli9pd77n7wp9sx58z1w 54.37.13.151:2377
docker swarm join-token worken

docker service update --replicas 6 web

mysql -h 172.26.0.2 -u root -p

docker exec -ti services-db-1 mysql -u root -ppass --execute "show databases; use woody; "

docker exec -ti services-db-1 bash

mysql -u root -ppass 
show databases;
use woody;
 select * from product;

# token actuel
docker swarm join --token SWMTKN-1-0fgy6omacj22d44xhg3iqijci5jy92usd1gid198mcaldpsz7u-8rfdg14tgzou6aovwc1pnyfl6 54.37.13.151:2377


sudo ufw allow 2377
sudo ufw allow 2376
sudo ufw allow 2375
sudo ufw allow 7946
sudo ufw allow 4789

cd ~/TP_Admin/l2-3/tp9/woodytoys/services
bash build_push.sh
docker stack deploy -c docker-compose.yml mystack
docker stack ls
docker stack ps mystack
docker stack rm mystack
docker stack services mystack
docker service scale mystack_db=1
docker service scale mystack_api=1
docker service scale mystack_front=1
docker service scale mystack_reverse=0
docker service scale mystack_redis=1

docker stack ps mystack