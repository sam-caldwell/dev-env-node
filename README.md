# Local Development Environment Setup with LocalStack

This project aims to create a local development environment that simulates AWS services using LocalStack. 
The setup includes:

- **EKS Cluster**: A simulated Elastic Kubernetes Service (EKS) cluster to run various microservices.
- **Container Registry**: LocalStack ECR (Elastic Container Registry) for managing container images.
- **Certificate Management**: LocalStack ACM (AWS Certificate Manager) for handling certificates.
- **Monitoring and Logging**: Prometheus and Grafana for monitoring application metrics and logs.
- **Data Store**: A 3-replica Redis cluster for caching and data storage.
- **Web API**: A 3-replica Node.js web API that interacts with Redis and exposes metrics for Prometheus.
- **Infrastructure as Code**: Configuration and management using Terraform and Terragrunt.
- **Local State Management**: Terraform state stored in a local `./tfstate` directory to eliminate the need for 
  remote state management.

## Project Components

### 1. EKS Cluster
- Simulated Kubernetes cluster managed by LocalStack.
- Supports essential Kubernetes features including creating and managing clusters and node groups.

### 2. LocalStack ECR
- A private Elastic Container Registry for managing Docker images.
- Public images will be pulled from Docker Hub and pushed to the LocalStack ECR for local testing.

### 3. LocalStack ACM
- Simulates certificate management through AWS Certificate Manager.
- May integrate with `cert-manager` for automated certificate handling within the Kubernetes cluster.

### 4. Monitoring
- **Prometheus**: Used to scrape and collect metrics from the web API and Redis.
- **Grafana**: Provides a dashboard for visualizing metrics collected by Prometheus.

### 5. Redis Cluster
- A 3-replica Redis cluster configured for data storage and caching to support the web API.

### 6. Node.js Web API
- A 3-replica Node.js application serving as the backend service.
- Communicates with the Redis cluster for data retrieval and storage.

### 7. Infrastructure Management
- **Terraform**: Used to define and provision the infrastructure.
- **Terragrunt**: Enhances Terraform configurations and manages dependencies.

### 8. State Management
- Terraform state files will be stored locally in the `./tfstate` directory, facilitating easier management without 
  the need for remote storage solutions.

## Getting Started

1. **Clone the repository**:
    ```bash
    git@github.com:sam-caldwell/dev-env-node.git
    cd ~/git/dev-env-node
    ```

2. **Set up LocalStack**:
   Ensure LocalStack is installed and running.  See [Setting Up LocalStack](./docs/setup-localstack.md)

3. **Deploy the infrastructure**:
To deploy the infrastructure defined in your Terraform configurations, follow these steps:
   1. **Navigate to the Terragrunt configuration directory**:
      Assuming you have organized your Terragrunt configurations in a subdirectory structure, navigate to the 
      appropriate directory where your `terragrunt.hcl` file is located. For example:
      ```bash
      cd ~/git/dev-env-node/iac
      ```
   2. **Initialize Terragrunt:** 
      Run the following command to initialize your Terragrunt configuration, which sets up the necessary backend 
      configuration and downloads the required Terraform modules.
      ```bash
      terragrunt init
      ```
   3. **Run the Terragrunt plan:**
      This step allows you to preview the changes that will be made to your infrastructure before applying them. 
      It provides a summary of the resources that will be created, updated, or destroyed.
      ```bash
      terragrunt plan
      ```
   4. **Apply the configuration:** 
      After reviewing the plan and confirming that everything looks correct, you can apply the configuration to deploy
      the infrastructure. This command will create the specified resources in your LocalStack EKS cluster.
      ```bash
      terragrunt apply
      ```
   5. **Verify the deployment:**
      Use the `aws` cli tool to verify the infrastructure expected.  For example:
      ```shell
      aws eks list-clusters --profile localstack
      ```

4. **Access the services**:
   Access the web API, Prometheus, and Grafana through the configured endpoints.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

## Acknowledgments
- [LocalStack Documentation](https://docs.localstack.cloud/user-guide/)
- [Terraform Documentation](https://www.terraform.io/docs)
# dev-env-node
