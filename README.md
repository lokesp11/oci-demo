# oci-demo

Step 1: Create and configure bastion host setup:
  - Use terraform code under bastion-setup folder to create VCN, Subnet, Security list, Compute.
  - Sample tfvar file is also kept under same folder for reference.
 
 Step 2: Created and configure application host setup:
  - Use terraform code under app-setup to create VCN, Subnet, Security list, Compute, load balancer, listener, backend sets.
  - Same code will also deploy all the required binaries and software components required to deploy your app.
  - Sample tfvar file is also kept under same folder for reference.
 
 Step 3: Perform application deployment:
  - Use terraform code kept under app-deployment folder to perform deployment.
  - Sample tfvar file is also kept under same folder for reference.
 
 Code enhacement:
  - Code enhancement logic is kept under fibonacci-enhacement folder using ruby.
