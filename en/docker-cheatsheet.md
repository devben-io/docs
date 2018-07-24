# DOCKER \| Cheatsheet

docker stats with container names instead of IDs

```
docker stats $(docker ps --format={{.Names}})
```

deletes old containers  and images

```
docker ps -a | grep "Exit\|Created" | cut -d ' ' -f 1 | xargs sudo docker rm; docker images | grep "<none>" | awk '{print $3}' | xargs sudo docker rmi
```



