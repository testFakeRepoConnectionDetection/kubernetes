# Network access of the kube-controller deployment (corp landing zone).

# Instant Payments Sanctions Filter
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-408"
  port             = 443
}

# Custody Holdings Service AMER
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-982"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.fx-pnl-explain-amer"
  port             = 443
}

module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.mortgages-balance-service-amer"
  port             = 443
}

# Rates Pricing Engine
module "egress_05" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-195"
  port             = 443
}
