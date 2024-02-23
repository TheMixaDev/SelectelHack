#!/bin/bash

echo "Starting minikube..."
minikube start

# cockroachdb
echo 'Creating cockroach cluster...'
kubectl apply -f ./cockroachdb/crds.yaml &&
kubectl apply -f ./cockroachdb/operator.yaml
sleep 30
kubectl create -f ./cockroachdb/config.yaml
sleep 30
kubectl create -f ./cockroachdb/client-secure-operator.yaml
echo 'CREATE USER usr WITH PASSWORD 'usr';'
echo 'GRANT admin TO usr;'
echo '\q'
kubectl kubectl exec -it -n cockroach-dev cockroachdb-0 -- ./cockroach sql --certs-dir=/cockroach/cockroach-certs --host=cockroachdb-public

# redis
echo 'Creating redis cluster...'
kubectl apply -f ./redis/config.yaml

# minio
echo 'Creating minio cluster...'
kubectl apply -f ./minio/config.yaml

echo 'Now you can run:'
echo 'docker exec -it redis redis-cli'
echo 'kubectl port-forward -n minio-dev pod/minio 9000 9090 -n minio-dev'
echo 'kubectl port-forward -n cockroach-dev service/cockroachdb-public 8080'
echo 'kubectl port-forward -n redis-dev deployment/redisinsight 5540'
