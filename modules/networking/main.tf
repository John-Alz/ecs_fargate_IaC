data "aws_vpc" "selected" {
  provider = aws.main
  filter {
    name   = "tag:Name"
    values = ["aws-landing-zone-VPC"]
  }
}

data "aws_subnets" "public" {
  provider = aws.main
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "tag:Name"
    values = var.public_subnet_names
  }
}

data "aws_acm_certificate" "existing" {
  provider = aws.main
  domain   = var.certificate_domain
  statuses = ["ISSUED"]
}