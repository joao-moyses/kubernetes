resource "aws_ecs_cluster" "liqi" {
  name               = "${var.name}-cluster"

  tags = {
    Environment = "production"
    Application = "api"
  }

}


resource "aws_ecs_task_definition" "liqi" {
  container_definitions    = file("task-definition.json")
  execution_role_arn       = "arn:aws:iam::761249182852:role/EcsTaskExecutionRole"
  family                   = var.name
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "2048"
  requires_compatibilities = ["FARGATE"]

  tags = {
    Environment = "production"
    Application = "api"
  }


}


resource "aws_cloudwatch_log_group" "log" {
  name = "/${var.name}-log-group"

  tags = {
    Environment = "production"
    Application = "api"
  }
}


resource "aws_cloudwatch_log_stream" "stream" {
  name           = var.name
  log_group_name = (aws_cloudwatch_log_group.log.id)

  tags = {
    Environment = "production"
    Application = "api"
  }


}


resource "aws_ecs_service" "liqi" {
  name                 = "${var.name}-service"
  cluster              = (aws_ecs_cluster.liqi.id)
  task_definition      = var.name
  launch_type          = "FARGATE"
  scheduling_strategy  = "REPLICA"
  desired_count        = 1
  force_new_deployment = true

  network_configuration {
    subnets          = [var.subnet_id1a, var.subnet_id1b]
    assign_public_ip = false
    security_groups = [(aws_security_group.fargate.id)]
  }

  load_balancer {
    target_group_arn = (aws_lb_target_group.liqi.id)
    container_name   = var.name
    container_port   = 3000
  }

  tags = {
    Environment = "production"
    Application = "api"
  }


}



#                                                     >>>  Criação de Cluster ECR   <<< 



resource "aws_ecr_repository" "liqi" {
  name                 = "${var.name}-ecr" 
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false 
  }
  
  tags = {
    Environment = "production"
    Application = "api"
  }

}



#           >>> Criação de Application Load Balancer, Listeners (Porta 80 Redirect para 443 e 444 forward para Target Group) e Target Group   <<< 




resource "aws_lb" "liqi" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-062530d76442ca9de"]
  subnets            = [var.subnet_id_pub1b, var.subnet_id_pub1a]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
    Application = "api"
  }


}


resource "aws_lb_target_group" "liqi" {
  name        = "${var.name}-target"
  target_type = "ip"
  port        =  3000
  protocol    = "HTTP"
  vpc_id      = "vpc-0cc91c26a25fb92b0"


  tags = {
    Environment = "production"
    Application = "api"
  }

}


resource "aws_lb_listener" "liqi" {

    load_balancer_arn          = (aws_lb.liqi.id)

    port                       = 443

    protocol                   = "HTTPS"

    certificate_arn = "arn:aws:acm:us-east-1:761249182852:certificate/95f9bb4e-73a9-47cf-a3b3-d5b2e159be4b"

    default_action {

        target_group_arn         = (aws_lb_target_group.liqi.id)

        type                     = "forward"

    }


  tags = {
    Environment = "production"
    Application = "api"
  }

}


resource "aws_lb_listener" "liqi1" {
  load_balancer_arn = (aws_lb.liqi.id)
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }


  tags = {
    Environment = "production"
    Application = "api"
  }

  }


#                                                  >>> Security Group <<<



resource "aws_security_group" "fargate" {
  name        = "${var.name}-fargate-security-group"
  description = "VPN_LIQI"
  vpc_id      = var.vpc_id

    tags = {
    Name = "${var.name}-fargate-security-group"
    Environment = "production"
    Application = "api"
  }


  ingress {
    security_groups = ["sg-03cd52f2e8951deb2"]
    description = "liqi_vpn"
    from_port = 0
    to_port = 0
    protocol = "-1"
  }


  ingress {
    security_groups = ["sg-062530d76442ca9de"]
    description     = "ingress alb"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
  }


    ingress {
    cidr_blocks = ["10.76.145.0/24"]
    description = "local"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }


    ingress {
    cidr_blocks = ["10.76.144.0/24"]
    description = "local"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }


  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

}




#                                          >>> Criação do Global Acelerator   <<<



resource "aws_globalaccelerator_accelerator" "liqi" {
  name            = "mmAcelerator"
  ip_address_type = "IPV4"
  enabled         = true


    tags = {
    liqi-market-maker = var.name
    Environment = "production"
    Application = "api"
  }
  
}


resource "aws_globalaccelerator_listener" "liqi" {
  accelerator_arn = (aws_globalaccelerator_accelerator.liqi.id)
  client_affinity = "SOURCE_IP"
  protocol        = "TCP"


  port_range {
    from_port = 80
    to_port   = 80
  }


  port_range {
    from_port = 443
    to_port   = 443
  }
}


resource "aws_globalaccelerator_endpoint_group" "liqi" {
  listener_arn = (aws_globalaccelerator_listener.liqi.id)

  endpoint_configuration {
    endpoint_id = (aws_lb.liqi.id)
    weight      = 100
  }
}



#                                   >>>  Criação de Auto_Scaling para o Serviço ECS_Fargate  <<<



/*resource "aws_appautoscaling_target" "ecs_target" {
  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "service/${"liqi"}/${"liqi"}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}


resource "aws_appautoscaling_policy" "ecs_policy_memory" {
  name               = "memory-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_target.service_namespace
 
  target_tracking_scaling_policy_configuration {
   predefined_metric_specification {
     predefined_metric_type = "ECSServiceAverageMemoryUtilization"
   }
 
   target_value       = 80
  }
}

resource "aws_appautoscaling_policy" "ecs_policy_cpu" {
  name               = "cpu-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_target.service_namespace
 
  target_tracking_scaling_policy_configuration {
   predefined_metric_specification {
     predefined_metric_type = "ECSServiceAverageCPUUtilization"
   }
 
   target_value       = 60
  }
}*/


module "ecs_elb" {
  source           = "../modules/ecs_elb"
  vpc_id           = (aws_vpc.Liqi.id)
  name             = "api-prod"
  subnet_id_pub1a  = (aws_subnet.public.id)
  subnet_id_pub1b  = (aws_subnet.public1.id)
  subnet_id1a      = (aws_subnet.private.id)
  subnet_id1b      = (aws_subnet.private1.id)
}
