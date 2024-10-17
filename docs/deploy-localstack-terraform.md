Deploy Localstack Infrastructure
================================

## Navigate to the Terragrunt configuration directory
   Assuming you have organized your Terragrunt configurations in a subdirectory structure, navigate to the
   appropriate directory where your `terragrunt.hcl` file is located. For example:
   ```bash
   cd ~/git/dev-env-node/iac
   ```

## Initialize Terragrunt
   Run the following command to initialize your Terragrunt configuration, which sets up the necessary backend
   configuration and downloads the required Terraform modules.
   ```bash
   terraform init
   ```

## Run the Terragrunt plan
   This step allows you to preview the changes that will be made to your infrastructure before applying them.
   It provides a summary of the resources that will be created, updated, or destroyed.
   ```bash
   terraform plan
   ```

## Apply the configuration
   After reviewing the plan and confirming that everything looks correct, you can apply the configuration to deploy
   the infrastructure. This command will create the specified resources in your LocalStack EKS cluster.
   ```bash
   terraform apply -var='email=dev-env-node@samcaldwell.net'
   ```
   <span style="color:red"> Be sure to use your email address.</span>

## Verify the deployment
   Use the `aws` cli tool to verify the infrastructure expected.  For example:
   ```shell
    $ aws eks list-clusters --profile localstack
    {
        "clusters": [
            "eks-cluster"
        ]
    }
    $ aws eks describe-cluster --name eks-cluster --query "cluster.status" --profile localstack
    "ACTIVE"
   ```

## Verify `kubectl` works
   The following command should work, but note that kubeconfig is located in the `iac` directory for now because
   we do not want to take the chance of overwriting someone's otherwise legitimate kubeconfig.
   ```bash
   $ export KUBECONFIG=$(pwd)/kubeconfig; !!
   export KUBECONFIG=$(pwd)/kubeconfig; kubectl get namespaces
   NAME              STATUS   AGE
   default           Active   9h
   kube-system       Active   9h
   kube-public       Active   9h
   kube-node-lease   Active   9h
   ```
   If the above test works use `mv kubeconfig ~/.kube/config` to simplify life.
