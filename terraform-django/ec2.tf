resource "aws_security_group" "django_sg" {
  name        = "django-sg"
  description = "Allow web and SSH traffic"

  # Allow SSH from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP on port 8001 (Django)
  ingress {
    from_port   = 8001
    to_port     = 8001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "django-sg"
  }
}


resource "aws_instance" "django_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.django_sg.id]

   user_data = <<-EOF
  #!/bin/bash
  apt-get update -y
  apt-get install -y docker.io
  systemctl start docker
  systemctl enable docker
  docker pull nomandev1011/django-todo:latest
  docker run -d -p 8001:8001 nomandev1011/django-todo:latest
EOF

  tags = {
    Name = "django-server"
  }
}