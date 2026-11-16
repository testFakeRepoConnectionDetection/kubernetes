# Network access of the kube-controller deployment (corp landing zone).

# Equity Derivatives Pricing Engine EMEA
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-590"
  port             = 443
}

# Regulatory Reporting Alert Generator
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-534"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.retail-accounts-document-store"
  port             = 443
}

module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.liquidity-risk-risk-reporting-apac"
  port             = 443
}

# Monitoring File Transfer Hub
module "egress_05" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-895"
  port             = 443
}
