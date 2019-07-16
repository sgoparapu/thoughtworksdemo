#### Creating Security Group for Application Load Balancer

resource "aws_security_group" "tw-alb" {
  name = "tw-alb"
  vpc_id = "${aws_vpc.tw-vpc.id}"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

### Creating Application Load Balancer

resource "aws_alb" "tw-alb01" {
  name = "thought-works-demo"
  subnets            = ["${aws_subnet.tw-public-subnet.id}","${aws_subnet.tw-public-subnet2.id}"]
  security_groups = ["${aws_security_group.tw-alb.id}"]
}

### Creating Target Group for Application Load Balancer

resource "aws_alb_target_group" "tw-group" {
  name     = "tw-alb-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.tw-vpc.id}"
  stickiness {
    type = "lb_cookie"
  }
  health_check {
    path = "/index.html"
    port = 80
  }
}

### Creating Listener for Application Load Balancer - Telling on which port to listen

resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = "${aws_alb.tw-alb01.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.tw-group.arn}"
    type             = "forward"
  }
}

### Attaching Instances to the ALB as the requirement is 2 instances only we are not using Auto Scaling rather attaching directly

resource "aws_alb_target_group_attachment" "attach0" {
  target_group_arn = "${aws_alb_target_group.tw-group.arn}"
  target_id = "${aws_instance.web01.id}"
}
resource "aws_alb_target_group_attachment" "attach1" {
  target_group_arn = "${aws_alb_target_group.tw-group.arn}"
  target_id = "${aws_instance.web02.id}"
}
