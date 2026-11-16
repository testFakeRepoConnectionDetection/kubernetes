# Network access of the kube-controller deployment (corp landing zone).

# Corporate Accounts Product Catalog APAC
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-470"
  port             = 443
}

# Counterparty Risk Collateral Engine AMER
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-990"
  port             = 443
}

# Equity Derivatives Hedging Service EMEA
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-875"
  port             = 443
}
