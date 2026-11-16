# Network access of the kube-controller deployment (corp landing zone).

module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.survey-collector"
  port             = 443
}

module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.monitoring-directory-service-apac"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.commodities-pricing-engine-amer"
  port             = 443
}

# Trade Surveillance Report Builder APAC
module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-356"
  port             = 443
}
