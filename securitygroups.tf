/*
  Default Security Group in the VPC
  TCP/22 SSH ingress allowed to ALL
  PING allowed to ALL
*/

resource "aws_security_group" "base_sg" {
  name        = "base_sg"
  description = "Basic Security Group"
  vpc_id      = "vpc-b89ee9dc"

  // SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // PING
  ingress {
    from_port   = 8
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // OUT
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/*
  elasticsearch SG
*/
resource "aws_security_group" "elasticsearch_sg" {
  name        = "elasticsearch_sg"
  description = "ElasticSearch Security Group"
  vpc_id      = "vpc-b89ee9dc"

  ingress {
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
