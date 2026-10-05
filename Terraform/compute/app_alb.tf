resource "aws_alb" "app_alb" {
  security_groups = [var.app_alb_sg]
  subnets = [ var.Puplic1_id, var.Puplic2_id ]
  name               = "app-alb"
  internal           = false
  load_balancer_type = "application"

}


resource "aws_alb_target_group" "app_target" {
  name = "app-target"
  port = 3000
  protocol_version = "HTTP1"
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "instance"
   health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }

}
resource "aws_alb_target_group_attachment" "app-attach" {
  target_group_arn = aws_alb_target_group.app_target.arn
  target_id = aws_instance.private_ec2.id
  port=3000
}
resource "aws_alb_listener" "htpp" {
  load_balancer_arn = aws_alb.app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.app_target.arn
  }
}