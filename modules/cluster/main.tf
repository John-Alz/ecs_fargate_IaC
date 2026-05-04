resource "aws_ecs_cluster" "this" {
  provider = aws.main
  name     = "ecs-${var.capacity}-${var.country}-${var.env}"
}