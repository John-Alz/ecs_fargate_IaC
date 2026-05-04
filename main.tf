module "networking" {
  source              = "./modules/networking"
  public_subnet_names = var.public_subnet_names
  certificate_domain  = var.certificate_domain
}

module "kms" {
  source   = "./modules/kms"
  capacity = var.capacity
  country  = var.country
  env      = var.env
}

module "ecr" {
  source        = "./modules/ecr"
  capacity      = var.capacity
  country       = var.country
  env           = var.env
  functionality = var.functionality
}

module "alb" {
  source          = "./modules/alb"
  capacity        = var.capacity
  country         = var.country
  env             = var.env
  vpc_id          = module.networking.vpc_id
  subnet_ids      = module.networking.public_subnet_ids
  certificate_arn = module.networking.certificate_arn
}

module "cluster" {
  source   = "./modules/cluster"
  capacity = var.capacity
  country  = var.country
  env      = var.env
}

module "ecs_reto" {
  providers = {
    aws.main = aws.main
  }

  source = "git@github.com:NequiTI/terraform_ecs_mod.git//modules/ecs?ref=v3.4.0"

  capacity      = var.capacity
  country       = var.country
  env           = var.env
  functionality = var.functionality
  serviceid     = var.serviceid

  container_port              = 80
  container_protocol          = "HTTP"
  container_health_check_path = "/"
  container_path              = "/app"
  container_timeout           = 30
  container_cpu               = 256
  container_memory            = 512
  desired_count               = 1
  container_image             = var.container_image


  enable_auto_scaling    = true
  enable_cpu_scaling     = true
  enable_memory_scaling  = false
  container_min_capacity = 1
  container_max_capacity = 3
  # cpu_utilization_up           = 70
  # cpu_utilization_down         = 20
  cpu_utilization_up           = 0.5
  cpu_utilization_down         = 0.1
  cooldown_period              = 60
  enable_perrequest_tt_scaling = false

  kms_key_arns = [module.kms.key_arn]

  log_retention_days = 7

  container_variables_secrets = {
    environment = []
    secrets     = []
  }

  depends_on = [
    module.cluster,
    module.alb,
    module.ecr,
  ]
}
