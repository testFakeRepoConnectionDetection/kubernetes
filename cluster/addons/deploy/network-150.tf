# Network access of the kube-controller deployment (corp landing zone).

# Equity Derivatives Algo Engine APAC
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-664"
  port             = 443
}

# SEPA Payment Gateway
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-234"
  port             = 443
}

# Deposits Product Catalog EMEA
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-789"
  port             = 443
}

module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.loans-document-store"
  port             = 443
}

# Rates Trade Capture APAC
module "egress_05" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-738"
  port             = 443
}
