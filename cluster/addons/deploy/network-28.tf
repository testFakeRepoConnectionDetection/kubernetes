# Network access of the kube-controller deployment (corp landing zone).

# Treasury Reporting Mart EMEA
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-367"
  port             = 443
}

# Liquidity Risk VaR Engine AMER
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-288"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.identity-token-service-apac"
  port             = 443
}
