output "region" {
    value = var.region
}

output "project_name"   {
    value = var.project_name
}

output "environment"   {
    value = var.environment
}

output "eks_cluster_name"   {
    value = var.eks_cluster_name
}

output "prod_eks_01_db_id" {
  value = aws_db_instance.rds.id
}

# output "prod_eks_01_db_cpu" {
#   value = aws_cloudwatch_metric_alarm.prod_eks_01_db_cpu.id
# }

# output "prod_eks_01_db_disk_queue" {
#   value = aws_cloudwatch_metric_alarm.prod_eks_01_db_disk_queue.id
# }

# output "prod_eks_01_db_disk_free" {
#   value = aws_cloudwatch_metric_alarm.prod_eks_01_db_disk_free.id
# }

# output "prod_eks_01_db__mem_free" {
#   value = aws_cloudwatch_metric_alarm.prod_eks_01_db__mem_free.id
# }

# output "database_cpu_credits" {
#   value = aws_cloudwatch_metric_alarm.database_cpu_credits.id
# }