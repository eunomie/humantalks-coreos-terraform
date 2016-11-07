resource "aws_instance" "elasticsearch" {
  instance_type               = "t2.micro"
  ami                         = "ami-7ddc960e"
  key_name                    = "${aws_key_pair.admin_key.key_name}"
  associate_public_ip_address = true
  subnet_id                   = "subnet-6f6f2919"
  vpc_security_group_ids      = ["${aws_security_group.base_sg.id}", "${aws_security_group.elasticsearch_sg.id}"]
  user_data                   = "${file("cloud-config/elasticsearch.yml")}"
}

resource "aws_key_pair" "admin_key" {
  key_name   = "admin_key"
  public_key = "${file("keys/admin.pub")}"
}
