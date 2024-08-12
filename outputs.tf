output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}

output "instance_id" {
  value = aws_instance.main.id
}

output "public_ip" {
  value = aws_instance.main.public_ip
}

output "tomcat_public_ip" {
  value = aws_instance.tomcat.public_ip
}

/*output "sonar_public_ip" {
  value = aws_instance.sonar.public_ip
}*/

output "tomcat2_public_ip" {
  value = aws_instance.tomcat2.public_ip
}

