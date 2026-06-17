output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.ironkube.endpoint
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.ironkube.name
}

output "node_group_status" {
  description = "Node group status"
  value       = aws_eks_node_group.workers.status
}
