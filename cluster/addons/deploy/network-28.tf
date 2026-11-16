# Network access of the kube-controller deployment (corp landing zone).

# Credit Trade Capture
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-525"
  port             = 443
}

module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.credit-risk-risk-reporting-apac"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.operational-risk-collateral-engine-emea"
  port             = 443
}

# Cash Management Settlement Engine
module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-744"
  port             = 443
}
