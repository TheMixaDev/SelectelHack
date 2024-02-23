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
kubectl exec -it cockroachdb-client-secure -- ./cockroach sql --certs-dir=/cockroach/cockroach-certs --host=cockroachdb-public
# CREATE USER usr WITH PASSWORD 'usr';
# GRANT admin TO usr;
# \q

# redis
echo 'Creating redis cluster...'
kubectl apply -f ./redis/config.yaml

echo 'All done...'
# kubectl port-forward service/cockroachdb-public 8080
# kubectl port-forward deployment/redisinsight 5540
