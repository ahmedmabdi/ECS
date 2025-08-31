#############################
# CloudWatch Log Group
#############################
resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${var.project_name}"
  retention_in_days = 7

  tags = {
    Name        = "${var.project_name}-logs"
    Environment = var.environment
  }
}
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.service_name}-CPU-High"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = var.cpu_threshold
  alarm_description   = "Alarm when ECS CPU exceeds threshold"
  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }
}