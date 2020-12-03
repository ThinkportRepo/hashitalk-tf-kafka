resource "aws_route53_zone" "main_domain" {
  name = var.domain

  vpc {
    vpc_id = var.vpc_id
  }
}
