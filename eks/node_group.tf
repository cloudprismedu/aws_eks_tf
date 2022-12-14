# Nodes in private subnets
resource "aws_eks_node_group" "cpu" {
  cluster_name                                        = "${var.eks_cluster_name}"
  node_group_name                                     = "${var.eks_cluster_name}-cpu"
  node_role_arn                                       = aws_iam_role.eks_nodes.arn
  subnet_ids                                          = var.private_subnet_ids
  ami_type                                            = "${var.cpu_ami_type}"
  disk_size                                           = "${var.disk_size}"
  instance_types                                      = "${var.cpu_instance_types}"

  scaling_config {
    desired_size                                      = "${var.cpu_desired_size}"
    max_size                                          = "${var.cpu_max_size}"
    min_size                                          = "${var.cpu_min_size}"
  }

  tags                                                = {
    Name                                              = "${var.eks_cluster_name}-cpu"
    project                                           = "${var.project_name}"
    "kubernetes.io/cluster/${var.eks_cluster_name}"   = "${var.eks_cluster_name}"
    Environment                                       = "${var.environment}"
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on                                          = [aws_iam_role_policy_attachment.aws_eks_worker_node_policy, aws_iam_role_policy_attachment.aws_eks_cni_policy, aws_iam_role_policy_attachment.ec2_read_only]
}

resource "aws_eks_node_group" "general" {
  cluster_name                                        = "${var.eks_cluster_name}"
  node_group_name                                     = "${var.eks_cluster_name}-general"
  node_role_arn                                       = aws_iam_role.eks_nodes.arn
  subnet_ids                                          = var.private_subnet_ids
  ami_type                                            = "${var.asterisk_ami_type}"
  disk_size                                           = "${var.disk_size}"
  instance_types                                      = "${var.asterisk_instance_types}"

  scaling_config {
    desired_size                                      = "${var.asterisk_desired_size}"
    max_size                                          = "${var.asterisk_max_size}"
    min_size                                          = "${var.asterisk_min_size}"
  }

  tags                                                = {
    Name                                              = "${var.eks_cluster_name}-general"
    project                                           = "${var.project_name}"
    "kubernetes.io/cluster/${var.eks_cluster_name}"   = "${var.eks_cluster_name}"
    Environment                                       = "${var.environment}"
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on                                          = [aws_iam_role_policy_attachment.aws_eks_worker_node_policy, aws_iam_role_policy_attachment.aws_eks_cni_policy, aws_iam_role_policy_attachment.ec2_read_only]
}

resource "aws_eks_node_group" "asterisk" {
  cluster_name                                        = "${var.eks_cluster_name}"
  node_group_name                                     = "${var.eks_cluster_name}-asterisk"
  node_role_arn                                       = aws_iam_role.eks_nodes.arn
  subnet_ids                                          = var.private_subnet_ids
  ami_type                                            = "${var.asterisk_ami_type}"
  disk_size                                           = "${var.disk_size}"
  instance_types                                      = "${var.asterisk_instance_types}"

  scaling_config {
    desired_size                                      = "${var.asterisk_desired_size}"
    max_size                                          = "${var.asterisk_max_size}"
    min_size                                          = "${var.asterisk_min_size}"
  }

  tags                                                = {
    Name                                              = "${var.eks_cluster_name}-asterisk"
    project                                           = "${var.project_name}"
    "kubernetes.io/cluster/${var.eks_cluster_name}"   = "${var.eks_cluster_name}"
    Environment                                       = "${var.environment}"
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on                                          = [aws_iam_role_policy_attachment.aws_eks_worker_node_policy, aws_iam_role_policy_attachment.aws_eks_cni_policy, aws_iam_role_policy_attachment.ec2_read_only]
}