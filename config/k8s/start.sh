#!/bin/bash

echo "Starting minikube..."
minikube start

# cockroachdb
echo 'Creating cockroach cluster...'
kubectl create -f ./cockroachdb/config.yaml

sleep 5

echo 'Creating cockroach load balancer...'
kubectl create -f ./cockroachdb/lb.yaml

# redis
echo 'Creating redis cluster...'
kubectl apply -f ./redis/config.yaml

sleep 10

# minio
echo 'Creating minio cluster...'
kubectl apply -f ./minio/config.yaml

echo '>> You can test your connection to redis:'
echo '>> nc -v <ip> <port>'
