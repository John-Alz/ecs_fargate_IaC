resource "aws_kms_key" "ecs" {
  provider                = aws.main
  description             = "KMS key para ECS ${var.capacity}-${var.country}-${var.env}"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}