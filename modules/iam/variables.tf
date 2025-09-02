variable "ecs_task_execution_role_name" {
  description = "Name of the ECS execution role for Fargate"
  type        = string
}

variable "ecs_task_role_name" {
  description = "Name of the ECS task role for the container"
  type        = string
}
