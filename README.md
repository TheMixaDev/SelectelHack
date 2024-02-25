

# Selectel Hackathon documentation
1. **DevOps documentation**
	1. **Prerequisites**
	2. **Configuration Files Overview**
	3. **Setup Instructions**
	4. **Usage**
	5. **Example Service List**
	6. **Troubleshooting**
	7. **Alternative**
2. **Telegram bot documentation**
	1. **Introduction**
	2. **Features**
	3. **Installation**
	4. **Configuration**
	5. **API Interactions**
	6. **Usage**
 3. **Golang backend API**
	 1. **Prerequisites**
	 2. **Configuration Files Overview**
	 3. **Usage**
	 4. **Troubleshooting**
3. **Database**
	1. **Overview** 
	2. **Schema**
	3. **Driver**
    
# DevOps documentation

## Prerequisites
- Kubernetes cluster managed by Minikube
- kubectl configured to interact with your cluster
- Docker (or compatible container runtime) installed
- Access to the Kubernetes YAML configuration files

## Configuration Files Overview
### cockroach/lb.yaml
Defines a LoadBalancer service named `cockroachdb-loadbalancer`, intended to expose the CockroachDB 	cluster's GRPC and HTTP ports (`26257` and `8080`, respectively) across the `cockroach-dev` namespace. This setup facilitates external access to the database.

### cockroach/config.yaml
- **Namespace Creation**: Defines the `cockroach-dev` namespace for the cluster.
- **NodePort Services**: Configures three NodePort services (`selectel-1`, `selectel-2`, `selectel-3`) to expose SQL and Admin UI ports for different nodes within the cluster, allowing direct access via specified node ports.
- **PersistentVolumeClaims and Jobs**: Includes configurations for persistent storage and initialization jobs necessary for setting up the CockroachDB cluster.

### redis/config.yaml
- **Namespace Creation**: Defines the `redis-dev` namespace for the cluster.
- **PersistentVolumeClaims and Jobs**: Includes configurations for persistent storage and initialization jobs necessary for setting up the Redis cluster.
- **Services and Deployments**: Configures Redisinsight as well as Redis with replication

### minio/config.yaml
> Not implemented
- **Namespace Creation**: Defines the `minio-dev` namespace for the cluster.
- **PersistentVolumeClaims and Jobs**: Includes configurations for persistent storage and initialization jobs necessary for setting up the Minio cluster.
- **Services and Deployments**: Configures and exposes MinIO as S3 


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

## Alternative

You can use `docker-compose.yaml` to deploy the whole project in one command
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

-   Start the bot by executing the main script `bun src/index.js `.
-   Users will be greeted with a welcome message prompting them to register or log in.
-   Once authenticated, users can navigate through the bot's menu to access different functionalities.
-   The bot uses keyboards for ease of navigation and interaction.

# Golang backend API

1.  **Project Title and Description** - Briefly describe what your project does, focusing on its role as an API for authentication and account data management.
2. **Core libraries**
3.  **Installation** - Provide instructions on how to install or integrate your service into a user's project, including any prerequisites like Go, Fiber, or other dependencies.
4.  **Usage** - Explain how to use the API, including how to set up routes and how clients can interact with the `/get/me` and other endpoints. Include examples of requests and responses.
5. **API Routes Documentation**
6.  **Configuration** - Detail any necessary configuration, such as setting up JWT keys or customizing middleware.

### Description

This project implements an authentication API service using Go, leveraging the Fiber web framework and JWT middleware for secure access control as well as native SQL querying. It's designed to provide endpoints for authentication and account data management, ensuring secure user data handling and token-based access control.

### Core libraries
- github.com/gofiber/contrib/jwt
- github.com/gofiber/fiber/v2
- github.com/golang-jwt/jwt/v5
- github.com/spf13/viper
- go.uber.org/zap

### Installation

To install this service in your project, follow these steps:

 -  Ensure you have Go installed on your system. You can download it from the official Go website.
 -  Clone this repository to your local machine or download the source code.
 -  Install the required dependencies  in your project directory

### Usage

To use the API, you need to set up routes and configure JWT middleware with your public and private keys. Here is a quick guide on setting up and using the API endpoints:

1.  Initialize your API routes with `SetupRoutesV1` function.
2.  Use the `/get/me` endpoint to retrieve or update account data, ensuring you pass a valid JWT token in the request header.

Example request to get account data:
```
GET /get/me Headers: 
Authorization: Bearer <your_jwt_token
```


### API Routes Documentation

### Authentication

#### Get User Data
- **Method:** GET
- **Route:** /get/me
- **Description:** Retrieves user data.
- **Handler Function:** `authGetMeHandler`

#### Update User Data
- **Method:** PATCH
- **Route:** /get/me
- **Description:** Updates user data.
- **Handler Function:** `authPatchMeHandler`

#### User Login
- **Method:** POST
- **Route:** /get/login
- **Description:** Logs in the user.
- **Handler Function:** `authPostLoginHandler`

---

### Donation Plan Management

#### Get All Donation Plans
- **Method:** GET
- **Route:** /donation_plan/
- **Description:** Retrieves all donation plans.
- **Handler Function:** `donationPlanGetHandler`

#### Create a Donation Plan
- **Method:** POST
- **Route:** /donation_plan/
- **Description:** Creates a new donation plan.
- **Handler Function:** `donationPlanPostHandler`

#### Get Donation Plan by ID
- **Method:** GET
- **Route:** /donation_plan/:id
- **Description:** Retrieves a specific donation plan by ID.
- **Handler Function:** `donationPlanGetWithIdHandler`

#### Update Donation Plan by ID
- **Method:** PUT
- **Route:** /donation_plan/:id
- **Description:** Updates a specific donation plan by ID.
- **Handler Function:** `donationPlanPutWithIdHandler`

#### Patch Donation Plan by ID
- **Method:** PATCH
- **Route:** /donation_plan/:id
- **Description:** Partially updates a specific donation plan by ID.
- **Handler Function:** `donationPlanPatchWithIdHandler`

#### Delete Donation Plan by ID
- **Method:** DELETE
- **Route:** /donation_plan/:id
- **Description:** Deletes a specific donation plan by ID.
- **Handler Function:** `donationPlanDeleteWithIdHandler`

#### Get Latest Donation Plan
- **Method:** GET
- **Route:** /donation_plan/latest
- **Description:** Retrieves the latest donation plan.
- **Handler Function:** `donationPlanGetLatestHandler`

---

### Donation Management

#### Get All Donations
- **Method:** GET
- **Route:** /donations/
- **Description:** Retrieves all donations.
- **Handler Function:** `donationsGetHandler`

#### Create a Donation
- **Method:** POST
- **Route:** /donations/
- **Description:** Creates a new donation.
- **Handler Function:** `donationsPostHandler`

#### Get Donation by ID
- **Method:** GET
- **Route:** /donations/:id
- **Description:** Retrieves a specific donation by ID.
- **Handler Function:** `donationsGetWithIdHandler`

#### Update Donation by ID
- **Method:** PUT
- **Route:** /donations/:id
- **Description:** Updates a specific donation by ID.
- **Handler Function:** `donationsPutWithIdHandler`

#### Patch Donation by ID
- **Method:** PATCH
- **Route:** /donations/
- **Description:** Partially updates a specific donation by ID.
- **Handler Function:** `donationsPatchWithIdHandler`

#### Delete Donation by ID
- **Method:** DELETE
- **Route:** /donations/:id
- **Description:** Deletes a specific donation by ID.
- **Handler Function:** `donationsDeleteWithIdHandler`

#### Check if Donation Exists
- **Method:** GET
- **Route:** /donations/is-exists
- **Description:** Checks if a donation exists.
- **Handler Function:** `donationsGetIsExistsHandler`

---

### Picture Management

#### Upload a Picture
- **Method:** POST
- **Route:** /picture/
- **Description:** Uploads a picture.
- **Handler Function:** `picturePostHandler`

#### Get All Pictures
- **Method:** GET
- **Route:** /picture/
- **Description:** Retrieves all pictures.
- **Handler Function:** `pictureGetHandler`

---

### Additional Middleware

- **Middleware:** Redirect
- **Description:** Performs redirection for any route that is not handled by fiber router to the given testing external API
- **Handler Function:** `utils.Redirect`

### Configuration

Configure the JWT middleware by providing your RSA public and private keys. Adjust the middleware settings according to your security requirements.

This file is configured for docker-compose deployment:

```json
{
  "app": {
    "port": "3033"
  },
  "dev": true,
  "db": {
    "user": "root",
    "host": "crdb",
    "port": "26257",
    "password": "",
    "dbname": "defaultdb",
    "sslmode": "disable",
    "sslrootcert": "database/cert/ca.crt",
    "sslcert": "database/cert/client.root.crt",
    "sslkey": "database/cert/client.root.key",
    "schema": "schema.sql"
  },
  "redis": {
    "ttl": 60,
    "host": "redis:6379",
    "password": "",
    "poll": 5
  },
  "bot": {
    "bot_id": "",
    "api_key": ""
  }
}

```
# Database

## Overview 
We use cockroach as main database. 
You can use either it or any other Postgresql compatible

## Schema 
You can see its schema and some migrated data from an external API in `database/sql` directory

## Driver
We use raw SQL and `jackc/pgx/v5` for executing statements,
