output "aws_instance_ids" {
  value = [aws_instance.heating.id, aws_instance.lights.id, aws_instance.status.id, aws_instance.auth.id]
}