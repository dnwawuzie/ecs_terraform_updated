output "ecs_taskdefinition" {
  value = aws_ecs_task_definition.flask_def.arn
}