output "launch_template_version" {
  value = aws_launch_template.app_launch_template.latest_version
}

output "launch_template_id" {
  value = aws_launch_template.app_launch_template.id
}
