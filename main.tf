resource "aws_instance" "example" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_docker.id]

  user_data = templatefile ("${path.module}/docker.sh.tftpl", {
    partition_number = 4
    extend_size = 30
})
  
  root_block_device {
    volume_type           = "gp3"
    volume_size           = 50
    tags = {
        Name = "docker"
        project = "roboshop"
        Environment = "dev"
    }
  tags = {
    Name = "docker"
    project = "roboshop"
    Environment = "dev"
  }
}

resource "aws_security_group" "allow_docker" {
  name        = "allow_docker"
  description = "Allow TLS inbound traffic and all outbound traffic"
 ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }

  tags = {
    Name = "allow_docker"
  }
}
