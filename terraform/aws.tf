data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "eb-creds"
}

locals {
  eb_creds = jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}

resource "aws_vpc" "tf_vpc" {
  cidr_block = local.vpc_cidr
  tags = {
    Name = "tf_vpc"
  }
}

# Create Subnet 1
resource "aws_subnet" "tf_subnet_1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "tf_subnet_1"
  }
}

# Create Subnet 2
resource "aws_subnet" "tf_subnet_2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "tf_subnet_2"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name = "tf_igw"
  }
}

# Create Route Table
resource "aws_route_table" "tf_route_table" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name = "tf_route_table"
  }
}

# Create a route in the route table
resource "aws_route" "tf_route" {
  route_table_id         = aws_route_table.tf_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.tf_igw.id
}

# Associate the route table with Subnet 1
resource "aws_route_table_association" "tf_route_table_assoc_1" {
  subnet_id      = aws_subnet.tf_subnet_1.id
  route_table_id = aws_route_table.tf_route_table.id
}

# Associate the route table with Subnet 2
resource "aws_route_table_association" "tf_route_table_assoc_2" {
  subnet_id      = aws_subnet.tf_subnet_2.id
  route_table_id = aws_route_table.tf_route_table.id
}

# Create NAT Gateway
resource "aws_eip" "tf_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "tf_nat_gateway" {
  allocation_id = aws_eip.tf_eip.id
  subnet_id     = aws_subnet.tf_subnet_1.id
  tags = {
    Name = "tf_nat_gateway"
  }
}

# Elastic Beanstalk setup
data "aws_iam_instance_profile" "example" {
  name = "EBS-Access-Role"
}

data "aws_iam_role" "example" {
  name = "aws-elasticbeanstalk-service-role"
}

resource "aws_elastic_beanstalk_application" "tf-test" {
  name        = "javaapplication"
  description = "Testing tf-elb"
}

resource "aws_elastic_beanstalk_environment" "tf-test-env" {
  name                = "javaapplicationenv"
  application         = aws_elastic_beanstalk_application.tf-test.name
  solution_stack_name = "64bit Amazon Linux 2 v4.5.3 running Tomcat 9 Corretto 8"
  tier                = "WebServer"
  
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = data.aws_iam_instance_profile.example.name
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCID"
    value     = aws_vpc.tf_vpc.id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", [aws_subnet.tf_subnet_1.id, aws_subnet.tf_subnet_2.id])
  }
  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = "t3.micro"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "true"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "public"
  }
}

output "url" {
  value = aws_elastic_beanstalk_environment.tf-test-env.endpoint_url
}

