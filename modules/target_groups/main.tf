
  resource "aws_lb_target_group" "heating" {
  name        = "heating-target-group"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  health_check {
    path                = "/health-check"
    protocol            = "HTTP"
    port                = "3000"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
  }
}

  resource "aws_lb_target_group" "lights" {
  name        = "lights-target-group"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  health_check {
    path                = "/health-check"
    protocol            = "HTTP"
    port                = "3000"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
  }
}

  resource "aws_lb_target_group" "status" {
  name        = "status-target-group"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  health_check {
    path                = "/health-check"
    protocol            = "HTTP"
    port                = "3000"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
  }
}

  resource "aws_lb_target_group" "auth" {
  name        = "auth-target-group"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  health_check {
    path                = "/health-check"
    protocol            = "HTTP"
    port                = "3000"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
  }
}

resource "aws_lb_target_group_attachment" "heating" {
  target_group_arn = aws_lb_target_group.heating.arn
  target_id        = var.target_id[0]
  
}

resource "aws_lb_target_group_attachment" "lights" {
  target_group_arn = aws_lb_target_group.lights.arn
  target_id        = var.target_id[1]
 
}

resource "aws_lb_target_group_attachment" "status" {
  target_group_arn = aws_lb_target_group.status.arn
  target_id        = var.target_id[2]

}

resource "aws_lb_target_group_attachment" "auth" {
  target_group_arn = aws_lb_target_group.auth.arn
  target_id        = var.target_id[3]
 
}