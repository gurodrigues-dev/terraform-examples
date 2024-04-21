output "irsa_cluster_autoscaler_controller_arn" {
  description = "IRSA ARN"
  value       = try(module.cluster_autoscaler_irsa.iam_role_arn, "")
}

output "cluster_version" {
  description = "kubernetes cluster version"
  value       = try(module.eks.cluster_version, "")
}

output "cluster_security_group_id" {
  description = "kubernetes cluster security group id"
  value       = try(module.eks.cluster_security_group_id, "")
}

output "node_security_group_id" {
  description = "kubernetes nodes security group id"
  value       = try(module.eks.node_security_group_id, "")
}

output "cluster_name" {
  description = "eks cluster name"
  value       = module.eks.cluster_name
}

output "cluster_ca_certificate" {
  description = "client certificate"
  value       = try(module.eks.cluster_certificate_authority_data, "")
  sensitive   = true
}

output "cluster_endpoint" {
  description = "aws api server endpoint"
  value       = try(module.eks.cluster_endpoint, "")
  sensitive   = true
}

output "cluster_status" {
  description = "eks status"
  value       = module.eks.cluster_status
}