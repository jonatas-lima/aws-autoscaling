resource "aws_key_pair" "default" {
  key_name   = "default-kp"
  public_key = file(var.public_key_path)
}

resource "aws_launch_template" "app_launch_template" {
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.default.key_name

  lifecycle {
    create_before_destroy = true
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_groups_ids
  }

  monitoring {
    enabled = true
  }

  user_data = base64encode(file("user_data.sh"))
}
