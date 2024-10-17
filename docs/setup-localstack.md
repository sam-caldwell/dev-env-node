# Setting Up LocalStack Pro

This document outlines the steps required to set up LocalStack Pro for local development. LocalStack simulates AWS services, enabling you to develop and test applications without needing to deploy them to actual AWS infrastructure.

## Prerequisites

Before starting, ensure you have the following installed:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Python (recommended version): [Install Python](https://www.python.org/downloads/)
- pip: Python package installer (usually included with Python)
- python virtualenv: Python virtual environment
- LocalStack Pro license key (if applicable)
- Aws Cli

## Step 1: Create a Virtual Environment

1. **Navigate to your project directory**:
    ```bash
    cd ~/git/dev-env-node
    ```

2. **Create a virtual environment**:
    ```bash
    python -m venv venv
    ```

3. **Activate the virtual environment**:
   ```bash
   source venv/bin/activate
   ```

## Step 2: Install LocalStack

1. **Install LocalStack**:
    ```bash
    pip install localstack
    ```

2. **Install LocalStack CLI**:
    ```bash
    pip install localstack-client
    ```

## Step 3: Set Up Environment Variables

Create a `.env` file in your project directory to define necessary environment variables. Include your LocalStack Pro license key:

```bash
export LOCALSTACK_AUTH_TOKEN='your-localstack-api-key'
```

## Step 4: Start LocalStack

Start localstack with the following command:
```bash
localstack start --host-dns -d
```
You should see logs indicating that LocalStack services are running.
> Note:
>      The `-d` parameter will start localstack in the background.  Some people prefer to see the localstack logs live
>      and prefer to not use the `-d` parameter in a separate terminal for real-time debugging.  This is your choice.

## Step 5: Verify the installation
```bash
localstack logs
```

## Step 6: Configure the AWS Cli
Create a localstack aws cli profile.  This will allow you to switch between the public AWS cloud and localstack:
```bash
aws configure --profile localstack
```
Set the following values:
- AWS Access Key ID: `test`
- AWS Secret Access Key: `test`
- Default region name: `us-east-1`
- Default output format: `json`

## Step 7: Multiple profiles
If you are running multiple profiles, your default profile should not be
the public cloud to avoid accidents.  Instead, create a config file like this--
```bash
~/.aws/config 
[default]
region = us-east-1
output = json
[profile public]
region = us-east-1
output = json
[profile localstack]
region = us-east-1
output = json
```
where `public` can be further segmented into `dev`, `stage`, `prod`.

But this will also mean storing your credentials by profile:
```bash
[default]

[public]
aws_access_key_id = AKIAxxxxxxxxxxxxxxxx
aws_secret_access_key = 6xxxxxxxxxx/xxxxxxxx/xxxxxxxxxxxxxxxxxxx

[localstack]
aws_access_key_id = test
aws_secret_access_key = test
```
This will ensure that if you do not specify `--profile` accidents will not happen.

## Step 8: Confirm the AWS localstack environment works
Run commands like the following and expect similar results:
```bash
(venv)  253 scaldwell@workstation:~/git/node/dev-env-node$ aws s3 ls --profile public
2021-04-11 11:06:29 asymmetric-effort.com
2021-04-11 11:06:29 create.sh
2021-04-11 11:06:29 samcaldwell.net
2021-04-11 11:06:29 samueldouglascaldwell.com
(venv) scaldwell@workstation:~/git/node/dev-env-node$ aws s3 mb s3://test --profile localstack
make_bucket: test
(venv) scaldwell@workstation:~/git/node/dev-env-node$ aws s3 ls --profile public
2021-04-11 11:06:29 asymmetric-effort.com
2021-04-11 11:06:29 create.sh
2021-04-11 11:06:29 samcaldwell.net
2021-04-11 11:06:29 samueldouglascaldwell.com
(venv) scaldwell@workstation:~/git/node/dev-env-node$ aws s3 ls --profile localstack
2024-10-14 17:48:34 test
```
In the above you will notice that:
- the `public` profile lists the s3 buckets for Sam Caldwell's personal AWS account
- we created a `test` bucket in localstack s3
- We were able to view the `test` bucket in localstack s3 using the `localstack` profile.