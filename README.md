# Terraform and Ansible Deployment Pipeline

This repository demonstrates a CI/CD pipeline for deploying Nginx on an Azure VM using Terraform and Ansible.

**Project Structure:**
├── README.md
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── backend.tf
│   ├── modules/
│   │   ├── vm/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   ├── outputs.tf
│   ├── ... (other Terraform files)
├── ansible/
│   ├── inventory
│   │   ├── hosts
│   ├── playbooks/
│   │   ├── deploy_nginx.yml
│   │   ├── roles/
│   │   │   ├── nginx/
│   │   │   │   ├── tasks/
│   │   │   │   │   ├── main.yml
│   │   │   │   ├── handlers/
│   │   │   │   │   ├── main.yml
│   │   │   │   ├── defaults/
│   │   │   │   │   ├── main.yml
│   │   │   ├── templates/
│   │   │   │   │   ├── main.yml
│   ├── ... (other Ansible files)
├── .azure-pipelines/
│   ├── pipeline.yml
├── ... (other files)

**Workflow:**

1. **Terraform Infrastructure:**
   - The `terraform` directory contains Terraform code to provision the Azure VM.
   - The `modules` directory may contain reusable Terraform modules (e.g., for VM creation, networking).
   - The `backend.tf` file defines the backend configuration for Terraform state storage (e.g., Azure Blob Storage).

2. **Ansible Deployment:**
   - The `ansible` directory contains Ansible playbooks and roles for deploying and configuring Nginx on the provisioned VM.
   - The `inventory` file defines the target hosts for Ansible.

3. **Azure DevOps Pipeline:**
   - The `pipeline.yml` file defines the CI/CD pipeline:
     - **Checkov:** Performs security checks on Terraform code.
     - **Tflint:** Performs linting and style checks on Terraform code.
     - **Terraform Init:** Initializes the Terraform workspace.
     - **Terraform Plan:** Generates an execution plan for the infrastructure changes.
     - **Manual Validation:** Includes a manual approval step before applying changes.
     - **Terraform Apply:** Applies the infrastructure changes and provisions the VM.
     - **Terraform Output:** Retrieves the VM's IP address using `terraform output`.
     - **Inventory Generation:** Uses `jq` to generate an Ansible inventory file with the VM's IP address.
     - **Ansible Playbook Execution:** Runs the Ansible playbook to deploy Nginx on the provisioned VM.

**Usage:**

1. **Configure Backend and Service Connections:**
   - Update the `backend.tf` file with your desired backend configuration.
   - Configure the necessary service connections (e.g., Azure Service Connection) in your Azure DevOps pipeline.

2. **Run the Pipeline:**
   - Trigger the pipeline in Azure DevOps.

**Key Features:**

*   Automated deployment of Nginx on Azure VMs using Terraform and Ansible.
*   Multi-stage pipeline with security checks, manual approvals, and infrastructure-as-code.
*   Dynamic inventory generation based on Terraform outputs.
*   Flexibility to adapt to different environments by changing subscription and backend configurations.

**Prerequisites:**

*   Azure subscription
*   Azure DevOps account
*   Terraform and Ansible installed
*   Basic understanding of Terraform, Ansible, and Azure DevOps

**Note:**

This is a basic example. You can customize and extend it based on your specific requirements and use cases.

This README provides a high-level overview of the project. You can add more details, such as:

*   Specific instructions for setting up the environment.
*   Detailed explanations of the pipeline steps.
*   Troubleshooting tips.
*   Best practices for security and maintainability.

Remember to keep the README concise, informative, and easy to understand for anyone who wants to learn about or use this project.
