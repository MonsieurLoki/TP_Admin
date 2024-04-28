docker swarm init
docker swarm join --token SWMTKN-1-289u3hqyh8fx088i3ypm2lhy54r45ljwfh4b59ij08y7d8t6c3-1yz60be3d96as8xl7jcitwmd6 192.168.0.217:2377
docker service create --name web -p 8080:80 --replicas 3 drapsag/mon-nginx:1.1
docker swarm join-token worken
docker service update --replicas 6 web
