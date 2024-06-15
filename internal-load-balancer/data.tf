data "aws_vpc_endpoint" "vpc_endpoint" {
  vpc_id       = "vpc-id-number"
  service_name = "com.amazonaws.us-east-1.execute-api"
}

data "aws_network_interface" "enis" {
  for_each = data.aws_vpc_endpoint.vpc_endpoint.network_interface_ids
  id       = each.value
}