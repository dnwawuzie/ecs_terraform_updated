resource "aws_ecs_task_definition" "flask_def" {
    family = "dev-to"
    container_definitions = <<TASK_DEFINITION
    [
    {
      "portMappings": [
        {
          "hostPort": 80,
          "protocol": "tcp",
          "containerPort": 80
        }
      ],
      "cpu": 512,
      "memory": 1024,
      "image": "663828089113.dkr.ecr.ca-central-1.amazonaws.com/flask:66c093e",
      "essential": true,
      "name": "flask"
    }
  ]
  TASK_DEFINITION
  
    network_mode = "awsvpc"
    requires_compatibilities = [
      "FARGATE"]
    memory = "1024"
    cpu = "512"
    execution_role_arn = var.ecs_role
    task_role_arn = var.ecs_role
  
    tags = {
      Name = "terraform-taskdef"
    }
  }
