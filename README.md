For Tradition Assignment

Note1: I chose not to use references for EC2 and EKS.(Like Blueprint, Terraform-AWS-EKS etc.)

Note2: I commented that Tasks not below are for demo.

Tasks and Solutions:

1-	Create a new vpc in your AWS account that will only include 3 public subnets with the following masks: 10.3.1.0/24 10.3.2.0/24 10.3.3.0/24

a-	Vpc.tf and subnet.tf are in the Tradition_EKS folder. I did not separate it as we will use it together later.

Paths: Trandition_EKS/vpc.tf  && Trandition_EKS/subnet.tf  



2-	Create a security group that will only allow access from your IP address for ports 443, 80, and 22.

b-	Also sg.tf in Transition_EKS too. I added ingresses to this part for allow access.

Paths: Trandition_EKS/sg.tf



3-	Create an auto-scaling group that will launch 2 ec2 instances running aws linux 2 and make sure apache httpd is installed in these instances when they are up and running.

c-	Auto-scaling group file in Transition_EC2 folder, ec2.tf.
For AWS Linux 2, I used “ami-09f6caae59175ba13”. It is Amazon Linux 2 Kernel 5.10 AMI.
For Apache httpd installation, I used userdata, its script is in apache-httpd.sh.

Paths: Trandition_EC2/ec2.tf && Trandition_EC2/apache-httpd.sh



4-	You will need to create an EKS cluster with managed node group using terraform.
This cluster should also use the above subnets and vpc that you created. This cluster will have a single managed node group including 2 ec2 instances running Bottlerocket.

d-	As I mentioned before, I kept the subnet and vpc directly in the EKS folder. Node Group is a separate file eks_node_group.tf in Transition_EKS.
I also added the eks_node_group ami_type variable for EC2s to be Bottlerocket. (ami_type = "BOTTLEROCKET_x86_64")

 Paths: Trandition_EC2/ eks_node_group.tf


Command List:

- terraform init
- terraform plan
- terraform apply
- git clone "repository-ssh-url"
- git add .
- git commit -m "message"
- git push
- aws configure
- aws eks --region eu-west-1 update-kubeconfig --name Tradition-EKS
- kubectl run nginx --image=nginx
