data "aws_ami" "joindevops" {
  most_recent = true
  owners      = ["973714476881"] # Canonical

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}