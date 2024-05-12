#!/bin/bash

VAULT_TOKEN=$VAULT_TOKEN


read -p "Insert path: " VAULT_SECRET_PATH

ENV_VARS=$(curl --header "X-Vault-Token: $VAULT_TOKEN" --request GET $VAULT_ADDR/$VAULT_SECRET_PATH | grep -o '"MYSQL_[^"]*":"[^"]*"' | sed 's/"//g' | sed 's/:/=/g' | sed 's/^/-e /' | tr '\n' ' ')



cd ./app
mvn clean package -DskipTests
cd ..

docker build -t quachuoiscontainer/vault-demo ./app 
docker build -t quachuoiscontainer/vault-mysql ./database

docker network create app-network

docker run -d -p 3306:3306 \
    --network app-network \
    $ENV_VARS \
    --name vault-mysql-container quachuoiscontainer/vault-mysql

sleep 5

docker run -d -p 8080:8080 \
    --network app-network \
    $ENV_VARS \
    --name vault-demo-container quachuoiscontainer/vault-demo

