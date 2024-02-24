
# Selectel Hackathon documentation
1. **DevOps documentation**
	1. **Prerequisites**: Listing the required tools and configurations needed before proceeding.
	2. **Configuration Files Overview**: A description of the provided `lb.yaml` and `config.yaml` files, their roles, and how they fit into the setup.
	3. **Setup Instructions**: Step-by-step instructions on how to use the configurations with Minikube to expose services to localhost.
	4. **Usage**: How to interact with the services once they are exposed.
	5. **Example Service List**
	6. **Troubleshooting**: Common issues and their solutions.
2. **Telegram bot documentation**
	1. **Introduction**
	2. **Features**
	3. **Installation**
	4. **Configuration**
	5. **API Interactions**
	6. **Usage**
# DevOps documentation
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
 - **Redis Insight  UI** : [http://localhost:5540](http://localhost:5540)
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
- **Service Not Accessible**: Ensure Minikube's tunnel is running and check for any error messages in the service's events and all of the ports are correctly forwarded
- **Port Conflicts**: If there are conflicts on ports `8080` or `26257`, verify that no other services are using those ports on your localhost.
- **Connection refused**: when trying to connect to Redis Insight  UI via minikube tunnel
	- **fix**: `kubectl port-forward -n redis-dev deployment/redisinsight 5540` and forward port

# Telegram bot documentation

## Introduction

DonorSearchBot is a Telegram bot designed to assist users in managing their blood donations, finding events, and accessing various related services directly from the Telegram app. It provides a convenient interface for users to register, log in, plan blood donations, and much more.

## Features

-   **Authentication:** New users can register, and existing users can log in using a secure authentication process.
-   **Main Menu Navigation:** Users can navigate through various options including scheduling blood donations, accessing their profile, and viewing upcoming events.
-   **Blood Donation:** Users can schedule donations, find where their blood type is needed, and view their donation history.
-   **User Profile:** Access and update personal profile information including bonus points and donor rating.
-   **Support the Project:** Options for users to donate to the project and support its operations.
-   **Event Information:** Users can view upcoming events related to blood donation.
-   **Image Upload:** Facility to upload documents or images as part of the donation process.

## Installation

1.  Clone the repository to your local machine.
2.  Install the required dependencies as listed in the `package.json` file.
3.  Set up your Telegram bot via BotFather and obtain the bot token.
4.  Configure your environment variables including the bot token and any other required API keys.
5. 
## Configuration

The bot's configuration is defined in a JSON object, specifying various settings critical for its operation. These include:

-   **Bot Token and Secret:** Essential for authenticating the bot with the Telegram API.
-   **Network Settings:** Defines URLs for the web app and API endpoints, facilitating interactions with external services.
-   **Server Configuration:** Specifies the port on which the bot's server should listen.
-   **Redis Configuration:** Details for connecting to a Redis database, including address, database number, and password.

##  API Interactions

The bot interacts with a backend API to perform a range of operations, as highlighted in the `http.js` file:

-   **Fetching User Donations:** Retrieves a user's donation history.
-   **User Information Retrieval:** Obtains user-specific information based on their unique hash.
-   **Donation Creation and Update:** Supports creating new donations or updating existing ones, including handling images associated with donations.
-   **File Upload:** Enables users to upload files (e.g., images) as part of the donation process.

## Usage

-   Start the bot by executing the main script.
-   Users will be greeted with a welcome message prompting them to register or log in.
-   Once authenticated, users can navigate through the bot's menu to access different functionalities.
-   The bot uses inline keyboards for ease of navigation and interaction.

