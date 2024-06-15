module "internal-api-gtw-vpc-endpoint-security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"

  name   = "internal-api-gtw-vpc-endpoint-security-group"
  vpc_id = "vpc-id-number"

  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "-1"
      description = "Allow all from VPC"
      cidr_blocks = "vpc-cidr/16"
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "-1"
      description = "Allow all outside"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = {
    "terraform" = true
  }
}

resource "aws_vpc_endpoint" "internal-api-gtw-endpoint" {
  vpc_id = "vpc-id-number"
  subnet_ids = [
    "subnet-private-1",
    "subnet-private-2"
  ]
  service_name      = "com.amazonaws.us-east-1.execute-api"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    module.internal-api-gtw-vpc-endpoint-security-group.security_group_id,
  ]

  private_dns_enabled = true

  tags = {
    "terraform" = true
  }

  depends_on = [
    module.internal-api-gtw-vpc-endpoint-security-group
  ]
}