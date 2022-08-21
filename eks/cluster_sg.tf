resource "aws_security_group" "eks_cluster_sg" {
  name        = "${var.eks_cluster_name}_cluster_sg"
  description = "Cluster communication with worker nodes"
  vpc_id      = var.vpc_id

   tags                                                  = {
    Name                                                = "${var.eks_cluster_name}_cluster_sg"
    "kubernetes.io/cluster/${var.eks_cluster_name}"     = "${var.eks_cluster_name}"
    Environment                                         = "${var.environment}"
  }
}

resource "aws_security_group_rule" "cluster_inbound" {
  description              = "Allow worker nodes to communicate with the cluster API Server"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster_sg.id
  source_security_group_id = aws_security_group.eks_nodes_sg.id
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "cluster_outbound" {
  description              = "Allow cluster API Server to communicate with the worker nodes"
  from_port                = 1024
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster_sg.id
  source_security_group_id = aws_security_group.eks_nodes_sg.id
  to_port                  = 65535
  type                     = "egress"
}