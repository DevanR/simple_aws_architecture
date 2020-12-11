resource "aws_launch_configuration" "ecs_launch_config" {
  image_id             = "ami-0fed6bb75d0a566fd"
  iam_instance_profile = aws_iam_instance_profile.ecs_profile.name
  security_groups      = [aws_security_group.ecs_sg.id]
  user_data            = "#!/bin/bash\necho ECS_CLUSTER=${var.APP_PREFIX}-ecr-cluster >> /etc/ecs/ecs.config"
  instance_type        = "t2.micro"
  associate_public_ip_address  = true
}

resource "aws_autoscaling_group" "failure_analysis_ecs_asg" {
  name                 = "asg"
  vpc_zone_identifier  = [aws_subnet.pub_subnet.id]
  launch_configuration = aws_launch_configuration.ecs_launch_config.name
  desired_capacity          = 1
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
}
