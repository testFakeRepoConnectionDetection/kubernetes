# Network access of the kube-controller deployment (corp landing zone).

# SWIFT Settlement Engine
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-401"
  port             = 443
}

# Liquidity Risk Collateral Engine AMER
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-917"
  port             = 443
}

# Legal Entities Data Quality Monitor EMEA
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-897"
  port             = 443
}

module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.counterparty-risk-collateral-engine"
  port             = 443
}
