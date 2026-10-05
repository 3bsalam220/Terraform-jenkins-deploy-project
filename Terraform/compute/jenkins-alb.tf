resource "aws_alb" "Jenkins-alb" {
  name = "jenkins-alb"
  security_groups = [var.Jenkins-alb-sg]
  subnets = [ var.Puplic1_id,var.Puplic2_id ]
   internal           = false
  load_balancer_type = "application"
}


resource "aws_alb_target_group" "jenkins_tg" {
 port = 8080
 target_type = "instance"
 protocol = "HTTP"
 protocol_version = "HTTP1"
 vpc_id = var.vpc_id
  health_check {
    path = "/login"
     healthy_threshold   = 2
    unhealthy_threshold = 3
  }
}

resource "aws_alb_target_group_attachment" "attach" {
  target_group_arn = aws_alb_target_group.jenkins_tg.arn
  target_id = aws_instance.jenkines_ec2.id
  port = 8080
}

resource "aws_alb_listener" "connect" {
  load_balancer_arn = aws_alb.Jenkins-alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.jenkins_tg.arn
  }
}