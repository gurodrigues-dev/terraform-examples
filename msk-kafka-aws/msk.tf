locals {
  tags = {
    terraform   = "true"
  }
  vpc_id = "your-vpc-id"
  private_subnets = ["subnet-id-az1", "subnet-id-az2"]
}

module "msk_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"

  name        = var.msk_cluster_security_group_name
  vpc_id      = local.vpc_id

  egress_with_cidr_blocks = [
    {
      description = "cluster all egress"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "egress"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  ingress_with_cidr_blocks = [
    {
      description                = "all from vpc cidr"
      protocol                   = "-1"
      from_port                  = 0
      to_port                    = 0
      type                       = "ingress"
      cidr_blocks                = "cidr-of-vpc"
    },
  ]

  tags = merge(
    {
      Name: var.msk_cluster_security_group_name
    },
    local.tags
  )
}

module "msk_cluster" {
  source = "terraform-aws-modules/msk-kafka-cluster/aws"
  version = "v2.3.0"

  name                   = var.msk_cluster_name
  kafka_version          = "3.4.0"
  number_of_broker_nodes = 2
  enhanced_monitoring = "PER_TOPIC_PER_BROKER"
  broker_node_client_subnets  = local.private_subnets
  broker_node_instance_type   = "kafka.t3.small"
  broker_node_security_groups = [ module.msk_security_group.security_group_id ]
  cloudwatch_log_group_name = "set/your/group/if/already/exists/optional"
  cloudwatch_logs_enabled = true

  tags = merge(
    {
      Name: var.msk_cluster_name
    },
    local.tags
  )

  depends_on = [ module.msk_security_group ]
}