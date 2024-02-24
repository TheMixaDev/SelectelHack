
# Selectel Hackathon documentation
1. **DevOps documentation**
	1.1. **Prerequisites**: Listing the required tools and configurations needed before proceeding.
	1.2. **Configuration Files Overview**: A description of the provided `lb.yaml` and `config.yaml` files, their roles, and how they fit into the setup.
	1.3. **Setup Instructions**: Step-by-step instructions on how to use the configurations with Minikube to expose services to localhost.
	1.4. **Usage**: How to interact with the services once they are exposed.
	1.5. **Example Service List**
	1.6. **Troubleshooting**: Common issues and their solutions.
2. **Telegram bot documentation**

## Prerequisites
- Kubernetes cluster managed by Minikube
- kubectl configured to interact with your cluster
- Docker (or compatible container runtime) installed
- Access to the Kubernetes YAML configuration files (`lb.yaml` and `config.yaml`)

## Configuration Files Overview
### lb.yaml
Defines a LoadBalancer service named `cockroachdb-loadbalancer`, intended to expose the CockroachDB 	cluster's GRPC and HTTP ports (`26257` and `8080`, respectively) across the `cockroach-dev` namespace. This setup facilitates external access to the database.

### config.yaml
Contains multiple configurations:
- **Namespace Creation**: Defines the `cockroach-dev` namespace for the cluster.
- **NodePort Services**: Configures three NodePort services (`selectel-1`, `selectel-2`, `selectel-3`) to expose SQL and Admin UI ports for different nodes within the cluster, allowing direct access via specified node ports.
- **PersistentVolumeClaims and Jobs**: Includes configurations for persistent storage and initialization jobs necessary for setting up the CockroachDB cluster.

## Setup Instructions
1. **Start Minikube**: Ensure Minikube is running and set to use the correct Kubernetes context.
   ```shell
   minikube start
   ```
2. **Deploy Configurations**: Apply the YAML configurations to your cluster.
   ```shell
   kubectl apply -f lb.yaml
   kubectl apply -f config.yaml
   ```
3. **Expose Services Locally**: Use Minikube's tunnel feature to expose the LoadBalancer service on your localhost.
   ```shell
   minikube tunnel
   ```

## Usage
Once the services are exposed, you can access the CockroachDB cluster's Admin UI and SQL client via the localhost:
 - **Admin UI**: [http://localhost:8080](http://localhost:8080)
 - **SQL Client**: Connect using any CockroachDB-compatible SQL client to `localhost:26257`.
	 - example: `cockroach sql --insecure --url "postgresql://localhost:26257/defaultdb?sslmode=disable"` 
- **Load Balancer**:  You can access pods through load balancer by running `minikube service list` and accessing given load balancer URL and port (grpc)

## Example service list

|    NAMESPACE   |           NAME           | TARGET PORT |            URL            |
|----------------|--------------------------|-------------|---------------------------|
| cockroach-dev  | cockroachdb              | No node port|                           |
| cockroach-dev  | cockroachdb-loadbalancer| grpc/26257  | http://192.168.49.2:32496 |
|                |                          | http/8080   | http://192.168.49.2:31363 |
| cockroach-dev  | selectel-1               | grpc/26257  | http://192.168.49.2:31257 |
|                |                          | http/8080   | http://192.168.49.2:31080 |
| cockroach-dev  | selectel-2               | grpc/26257  | http://192.168.49.2:31258 |
|                |                          | http/8080   | http://192.168.49.2:31180 |
| cockroach-dev  | selectel-3               | grpc/26257  | http://192.168.49.2:31259 |
|                |                          | http/8080   | http://192.168.49.2:31280 |
| redis-dev      | redis                    |      6379   | http://192.168.49.2:31740 |
| redis-dev      | redisinsight             |      5540   | http://192.168.49.2:30655 |



## Troubleshooting
- **Service Not Accessible**: Ensure Minikube's tunnel is running and check for any error messages in the service's events.
- **Port Conflicts**: If there are conflicts on ports `8080` or `26257`, verify that no other services are using those ports on your localhost.

