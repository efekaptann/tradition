resource "aws_launch_configuration" "apache_config" {
  name_prefix     = "apache-config"
  image_id        = "ami-09f6caae59175ba13"
  instance_type   = "t2.micro"
  user_data       = file("apache-httpd.sh")
  security_groups = [aws_security_group.ec2_security_group.id]

}

resource "aws_autoscaling_group" "apache_asg" {

  vpc_zone_identifier       = [for i in aws_subnet.ec2_subnet[*] : i.id]
  launch_configuration      = aws_launch_configuration.apache_config.name
  desired_capacity          = 2
  max_size                  = 2
  min_size                  = 2
  health_check_grace_period = 30
  health_check_type         = "EC2"

  tag {
    key                 = "Name"
    value               = "ec2 apache instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}