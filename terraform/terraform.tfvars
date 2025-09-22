aws_region     = "us-east-1"
project_name   = "demo-app"
instance_type  = "t3.micro"
key_name       = "my-key"                # replace with your EC2 key pair name
public_key_path = "scp C:/Users/UDHAYA/.ssh/id_rsa.pub ubuntu@<54.92.203.101>:~/id_rsa.pub"    # replace with your public key path
git_repo       = "https://github.com/your-username/demo-react-microservices-terraform.git"  # replace with your repo URL
my_ip_cidr     = "51.241.192.147/32"      # replace with your own public IP/32 for SSH access
