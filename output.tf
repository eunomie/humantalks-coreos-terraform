output "Elastic IP" {
  value = "${aws_instance.elasticsearch.public_ip}"
}

output "Elastic SSH" {
  value = "ssh core@${aws_instance.elasticsearch.public_ip} -i keys/admin"
}

output "Elastic Search Query" {
  value = "curl http://${aws_instance.elasticsearch.public_ip}:9200"
}
