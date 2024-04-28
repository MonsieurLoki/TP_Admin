docker service create --name web -p 8080:80 --replicas 3 drapsag/mon-nginx:1.1

docker swarm join --token SWMTKN-1-2vv3t49fiz7vb1tq02351pkyzqz1jkwz5y2u9hpupi5ciz94dy-dr1qehli9pd77n7wp9sx58z1w 54.37.13.151:2377
docker swarm join-token worken

docker service update --replicas 6 web