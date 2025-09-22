aws_region      = "us-east-1"
project_name    = "TerraformWeb"
instance_type   = "t3.micro"
key_name        = "Devops_key"  # replace with the AWS EC2 key pair name you used when launching the instance
public_key_path = "/home/ubuntu/id_rsa.pub"  # path to your public key uploaded to EC2
git_repo        = "https://github.com/Suchiudhaya/TerraformApp.git"
my_ip_cidr      = "51.241.192.147/32"  # replace with your current public IP for SSH access
