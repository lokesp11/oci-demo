# oci-demo

**Step 1:** Create and configure bastion host setup:
  - Use terraform code under bastion-setup folder to create VCN, Subnet, Security list, Compute.
  - Sample tfvar file is also kept under same folder for reference.



#### Note: All the below steps need to be performed from the bastion host which was created in step 1.
#### ssh access to application network is only accessible from bastion host network and its required to run deployment scripts.
 
**Step 2:** Create and configure application host setup:
  - Use terraform code under app-setup to create VCN, Subnet, Security list, Compute, load balancer, listener, backend sets.
  - Same code will also deploy all the required binaries and software components required to deploy your app.
  - Sample tfvar file is also kept under same folder for reference.
 
**Step 3:** Perform application deployment:
  - Use terraform code kept under app-deployment folder to perform deployment.
  - Sample tfvar file is also kept under same folder for reference.

**Step 4:** Create and configure grafana host setup:
  - Use terraform code under grafana-setup to Compute, create listener, backend sets to be used with same load balancer created for app server.
  - Same code will also deploy all the required binaries and software components required to deploy grafana.
  - Sample tfvar file is also kept under same folder for reference.
 
**Code enhacement:**
  - Code enhancement logic is kept under fibonacci-enhacement folder using ruby.

**Terraform Commands to be run from respective folder**
```bash
terraform init
terraform plan -var-file *.tfvar (each folder is having its own tfvar to be used)
terraform apply -var-file *.tfvar (each folder is having its own tfvar to be used)
```
