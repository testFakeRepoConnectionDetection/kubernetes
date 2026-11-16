# Network access of the kube-controller deployment (corp landing zone).

# Settlement Holdings Service AMER
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-440"
  port             = 443
}

# Regulatory Reporting Transaction Monitor AMER
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-303"
  port             = 443
}

# Prices Golden Source
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-148"
  port             = 443
}
