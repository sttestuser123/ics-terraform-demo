resource "aws_security_group" "allow_rdp" {
  count = var.secure ? 0 : 1 
  name        = "allow_rdp"
  description = "Allow RDP inbound traffic"

  ingress {
    description = "Allow RDP from anywhere" 
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}