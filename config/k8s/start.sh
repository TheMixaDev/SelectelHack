#!/bin/bash

echo "Starting minikube..."
minikube start

sleep 15

# cockroachdb
echo 'Creating cockroach cluster...'
kubectl create -f ./cockroachdb/config.yaml

sleep 10

echo 'Creating cockroach load balancer...'
kubectl create -f ./cockroachdb/lb.yaml

sleep 15

# redis
echo 'Creating redis cluster...'
kubectl apply -f ./redis/config.yaml

sleep 15

# minio
echo 'Creating minio cluster...'
kubectl apply -f ./minio/config.yaml

echo '>> You can test your connection to redis:'
echo '>> nc -v <ip> <port>'
