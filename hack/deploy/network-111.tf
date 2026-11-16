# Network access of the kube-controller deployment (corp landing zone).

module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.cost-allocation-funding-planner-apac"
  port             = 443
}

# Settlement Asset Servicing
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-320"
  port             = 443
}

# Trade Surveillance Evidence Archive AMER
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-497"
  port             = 443
}

# Deposits Credit Scoring
module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-785"
  port             = 443
}
