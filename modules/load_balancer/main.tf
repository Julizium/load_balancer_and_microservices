resource "aws_lb" "main" {
  name               = "ce-smart-home-lb"
  internal           = false  
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = 3000
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener_rule" "heating" {
  listener_arn = aws_lb_listener.main.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = var.target_group_arn.heating.arn
  }

  condition {
    path_pattern {
      values = ["/ce-smart-home-heating*"]
    }
  }
}

resource "aws_lb_listener_rule" "lights" {
  listener_arn = aws_lb_listener.main.arn
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = var.target_group_arn.lights.arn
  }

  condition {
    path_pattern {
      values = ["/ce-smart-home-lights*"]
    }
  }
}

resource "aws_lb_listener_rule" "status" {
  listener_arn = aws_lb_listener.main.arn
  priority     = 300

  action {
    type             = "forward"
    target_group_arn = var.target_group_arn.status.arn
  }

  condition {
    path_pattern {
      values = ["/ce-smart-home-status*"]
    }
  }
}

resource "aws_lb_listener_rule" "auth" {
  listener_arn = aws_lb_listener.main.arn
  priority     = 400

  action {
    type             = "forward"
    target_group_arn = target_group_arn.auth.arn
  }

  condition {
    path_pattern {
      values = ["/ce-smart-home-auth*"]
    }
  }
}