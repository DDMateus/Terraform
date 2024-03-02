# Dynamic Website Deployment on AWS

<p align="justify">This Terraform project automates the deployment of a dynamic website on Amazon Web Services (AWS) infrastructure. Leveraging Infrastructure as Code (IaC) principles, we use Terraform to provision various AWS services required to host and manage the website.</p>

## Architecture

![image](https://github.com/DDMateus/Terraform/assets/88774178/d8157d41-2824-4df5-8bec-9cc97f463425)


We utilize Terraform to create and configure the following AWS services:

- **VPC (Virtual Private Cloud):** Provides an isolated virtual network environment for deploying resources securely within AWS.
- **NAT Gateways:** Enables private instances within the VPC to access the internet while remaining private.
- **Security Groups:** Acts as virtual firewalls to control inbound and outbound traffic to AWS resources.
- **RDS (Relational Database Service):** Managed database service for hosting relational databases like MySQL, PostgreSQL, etc.
- **Application Load Balancer:** Distributes incoming traffic across multiple EC2 instances to ensure high availability and scalability.
- **SNS (Simple Notification Service):** Facilitates the publishing and subscription of messages or notifications across distributed systems.
- **Auto Scaling Group:** Automatically adjusts the number of EC2 instances in response to changes in demand or traffic.
- **Route 53:** AWS's scalable Domain Name System (DNS) web service for routing end-users to internet applications.

## DevOps Tools Utilized

We employ the following DevOps tools in our project:

- **GitHub:** Version control platform for managing and collaborating on code repositories.
- **Git:** Distributed version control system used for tracking changes in codebases.
- **Visual Studio Code:** Lightweight, extensible code editor with built-in Git integration and support for various programming languages.
- **AWS CLI (Command Line Interface):** Command-line tool for managing AWS services and resources from the terminal or shell script.

## Usage Instructions

Follow the steps below to use this Terraform project:

1. **Clone the Repository:**
   - Create a Terraform repository and clone it to your local machine using Git.

![image](https://github.com/DDMateus/Terraform/assets/88774178/15eb465c-cf24-439b-98af-db6eda1e8388)

2. **Edit README.md File:**
   - Edit the README.md file and push changes from the local repository to the remote repository.

![image](https://github.com/DDMateus/Terraform/assets/88774178/5d0f3750-6bb8-41ed-8a9d-9cb35e8c6389)

![image](https://github.com/DDMateus/Terraform/assets/88774178/9a16cd8d-598c-485d-9811-1877ffbd08c3)

![image](https://github.com/DDMateus/Terraform/assets/88774178/70778201-6750-4f36-86c5-ab06df57e880)

![image](https://github.com/DDMateus/Terraform/assets/88774178/294a70b8-23cd-4365-a8f5-3ad8a6dbd393)

![image](https://github.com/DDMateus/Terraform/assets/88774178/a7490654-9dec-4889-95cd-49dad4719047)

![image](https://github.com/DDMateus/Terraform/assets/88774178/29002d87-64b4-4f7d-ab47-1a28c978fd81)

3. **Create an IAM User:**
   - Create an IAM user with Administrator access for the Terraform project and generate access keys.

![image](https://github.com/DDMateus/Terraform/assets/88774178/e78cf7d4-6a78-4f6d-925e-ec9630f0999b)

![image](https://github.com/DDMateus/Terraform/assets/88774178/e5e29379-1fd3-4d09-a64a-34710331daef)

![image](https://github.com/DDMateus/Terraform/assets/88774178/57b92c43-9cc3-42f0-b08c-089b63c3d6e6)

![image](https://github.com/DDMateus/Terraform/assets/88774178/d6527fd9-5b95-4fe4-9353-76a2bfad977a)

![image](https://github.com/DDMateus/Terraform/assets/88774178/447acb61-3f6a-43ef-a477-039eed9ae8a8)

![image](https://github.com/DDMateus/Terraform/assets/88774178/8fe0aeb3-147f-4c2b-a8e6-a6b5d0a5b0cc)

4. **Configure AWS CLI:**
   - Configure AWS CLI to start using your user credentials.

``` powershell
aws configure --profile <IAM user>
```

5. **Create an S3 Bucket:**
   - Create an S3 bucket to store the Terraform state file.

![image](https://github.com/DDMateus/Terraform/assets/88774178/10201e92-5a0e-43e1-a190-058f9136d157)

![image](https://github.com/DDMateus/Terraform/assets/88774178/aae110e6-682c-45cc-a7a0-f88306e3393b)

6. **Terraform Authentication with AWS:**
   - [Configure Terraform to authenticate with AWS by providing proper credentials](https://github.com/DDMateus/Terraform/blob/9b8ed5732031269f7cb39b12e4d5ee36e1638b5b/Deploy%20a%20Dynamic%20Website%20on%20AWS/main.tf).


7. **Initialize Terraform:**
   - Run `terraform init` to initialize the Terraform working directory.

```powershell
terraform init
```

![image](https://github.com/DDMateus/Terraform/assets/88774178/bf655b65-1482-4955-ba13-9ee5535396ab)

![image](https://github.com/DDMateus/Terraform/assets/88774178/8ad8c0c3-f05b-4a5c-81fa-ca1a9df12e3b)

8. **Push Changes to GitHub:**
   - Learn to push the changes made to the GitHub repository along the project development

![image](https://github.com/DDMateus/Terraform/assets/88774178/52e8438c-2950-4a1d-9b53-3a408b357224)

![image](https://github.com/DDMateus/Terraform/assets/88774178/430fe2cd-627e-4a67-ba55-1deddd201f7a)

![image](https://github.com/DDMateus/Terraform/assets/88774178/f2642e02-5e41-4b05-8cd2-4f3591f87b82)

![image](https://github.com/DDMateus/Terraform/assets/88774178/516a38b6-c86a-4a59-a634-1b4158ab3d48)

![image](https://github.com/DDMateus/Terraform/assets/88774178/b30922db-d591-478e-8eff-0dd3e04a3d99)

10. **Repeat Steps for Each Component:**
    - Follow the provided Terraform configurations to creat each AWS component such as [VPC](https://github.com/DDMateus/Terraform/blob/9b8ed5732031269f7cb39b12e4d5ee36e1638b5b/Deploy%20a%20Dynamic%20Website%20on%20AWS/vpc.tf), [NAT Gateway](https://github.com/DDMateus/Terraform/blob/9b8ed5732031269f7cb39b12e4d5ee36e1638b5b/Deploy%20a%20Dynamic%20Website%20on%20AWS/natgateway.tf), [Security Groups](https://github.com/DDMateus/Terraform/blob/9b8ed5732031269f7cb39b12e4d5ee36e1638b5b/Deploy%20a%20Dynamic%20Website%20on%20AWS/securitygroup.tf), [RDS](https://github.com/DDMateus/Terraform/blob/9b8ed5732031269f7cb39b12e4d5ee36e1638b5b/Deploy%20a%20Dynamic%20Website%20on%20AWS/RDS.tf), [ALB](https://github.com/DDMateus/Terraform/blob/9b8ed5732031269f7cb39b12e4d5ee36e1638b5b/Deploy%20a%20Dynamic%20Website%20on%20AWS/ALB.tf), [SNS](https://github.com/DDMateus/Terraform/blob/9b8ed5732031269f7cb39b12e4d5ee36e1638b5b/Deploy%20a%20Dynamic%20Website%20on%20AWS/SNS.tf), [Auto Scaling Group](https://github.com/DDMateus/Terraform/blob/9b8ed5732031269f7cb39b12e4d5ee36e1638b5b/Deploy%20a%20Dynamic%20Website%20on%20AWS/ASG.tf), [Route 53](https://github.com/DDMateus/Terraform/blob/9b8ed5732031269f7cb39b12e4d5ee36e1638b5b/Deploy%20a%20Dynamic%20Website%20on%20AWS/route53.tf), [RDS](https://github.com/DDMateus/Terraform/blob/9b8ed5732031269f7cb39b12e4d5ee36e1638b5b/Deploy%20a%20Dynamic%20Website%20on%20AWS/RDS.tf), [Security Groups](https://github.com/DDMateus/Terraform/blob/9b8ed5732031269f7cb39b12e4d5ee36e1638b5b/Deploy%20a%20Dynamic%20Website%20on%20AWS/securitygroup.tf) and [variables](https://github.com/DDMateus/Terraform/blob/9b8ed5732031269f7cb39b12e4d5ee36e1638b5b/Deploy%20a%20Dynamic%20Website%20on%20AWS/variable.tf).
   
11. **Terraform commands**
    - Run the following commands to build with Terraform.

```powershell
terraform validate
```

```powershell
terraform plan
```

```powershell
terraform apply
```

12. **Clean Up Resources:**
    - After testing or when no longer needed, clean up the resources created using Terraform.

```powershell
terraform destroy
```

## Terraform Outputs

<p align="justify">You can retrieve useful information about the deployed infrastructure using Terraform outputs, such as VPC ID, subnet IDs, and website URL.</p>

```HCL
# Display Values
output "vpc_id" {
    value = aws_vpc.VPC.id
}

output "public_subnet_az1_id" {
    value = aws_subnet.Private_App_Subnet_AZ1.id
}

output "website_url" {
    value = join("", ["https://", var.Record_name, ".", var.Domain_name])
}
```
