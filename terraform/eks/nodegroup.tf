# Node group role
resource "aws_iam_role" "node_group_role" {
  name = "ironkube-node-group-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach policies to node group role
resource "aws_iam_role_policy_attachment" "node_group_policies" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ])
  policy_arn = each.value
  role       = aws_iam_role.node_group_role.name
}

# Node group (worker nodes)
resource "aws_eks_node_group" "workers" {
  cluster_name    = aws_eks_cluster.ironkube.name
  node_group_name = "ironkube-workers"
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids      = aws_subnet.public[*].id

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.micro"]

  tags = {
    Name = "ironkube-worker-node"
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_group_policies
  ]
}
