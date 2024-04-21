#- General
variable region {
  description = "aws region"
  type        = string

  default     = "sa-east-1"
}

#- EKS
variable cluster_name {
  description = "kubernetes cluster name"
  type        = string

  default     = "example-nprod"
}

variable cluster_version {
  description = "kubernetes version"
  type        = string

  default     = "1.28"
}

#- IAM IRSA
variable cluster_autoscaler_controller_irsa_name {
  description = "irsa for csi ebs controller"
  type        = string

  default     = "example-nprod-cluster-autoscaler-controller-irsa"
}

variable vpc_cni_irsa_name {
  description = "irsa for vpc cni on worker nodes"
  type        = string

  default     = "example-nprod-vpc-cni-node-irsa"
}