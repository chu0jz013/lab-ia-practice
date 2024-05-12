docker rm -f vault-mysql-container
docker rm -f vault-demo-container
docker image rm -f quachuoiscontainer/vault-mysql
docker image rm -f quachuoiscontainer/vault-demo
docker network rm -f app-network