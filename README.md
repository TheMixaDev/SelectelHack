Sure, here's a formatted version of the README document:

---

# SelectelHack

## K8S & Docker Setup

This project utilizes Kubernetes (K8S) and Docker for container orchestration. Follow the steps below to set up the environment:

### To Build

1. Make the start script executable:
    ```bash
    sudo chmod +x config/k8s/start.sh
    ```

2. Navigate to the Kubernetes configuration directory:
    ```bash
    cd config/k8s
    ```

3. Execute the start script:
    ```bash
    ./start.sh
    ```

4. Return to the project root directory:
    ```bash
    cd ..
    ```

5. Start Docker Compose:
    ```bash
    docker-compose up
    ```

### Forward Redis to Localhost

Use the following commands to forward Redis to localhost:

```bash
kubectl port-forward -n redis-dev service/redis 6379
ssh root@92.255.67.88 -L 6379:localhost:6379
```

#### Redis Connection Details
- **Login:** empty
- **Password:** empty
- **Database:** 0
- **SSL:** false

### Forward CockroachDB to Localhost

To forward CockroachDB to localhost, run the following commands:

```bash
kubectl port-forward -n cockroach-dev service/cockroachdb-public 26257
ssh root@92.255.67.88 -L 26257:localhost:26257
```

#### CockroachDB Connection Details
- **Login:** root
- **Password:** empty
- **Database:** defaultdb
- **SSL:** true

---

This README provides instructions for setting up the development environment using Kubernetes and Docker. Follow the steps outlined above to get started with the project.