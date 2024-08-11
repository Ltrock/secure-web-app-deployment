# ec2.tf
resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.web_sg.id]
  key_name                    = "mykeypair"
  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-web-server"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "Hello, Secure World" > /var/www/html/index.html
              EOF
}
