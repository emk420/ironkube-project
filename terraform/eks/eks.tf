# EKS Cluster role
resource "aws_iam_role" "eks_cluster_role" {
  name = "ironkube-eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach required policies to cluster role
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

# EKS Cluster
resource "aws_eks_cluster" "ironkube" {
  name     = "ironkube-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.30"

  vpc_config {
    subnet_ids = aws_subnet.public[*].id
  }

  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]

  tags = {
    Name = "ironkube-cluster"
  }
}
