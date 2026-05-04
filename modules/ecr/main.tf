resource "aws_ecr_repository" "this" {
  provider             = aws.main
  name                 = lower("${var.capacity}-${var.country}-${var.functionality}-${var.env}")
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
