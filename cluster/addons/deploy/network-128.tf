# Network access of the kube-controller deployment (corp landing zone).

module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.regulatory-reporting-alert-generator-apac"
  port             = 443
}

# Instant Payments Payment Hub AMER
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-153"
  port             = 443
}

# Monitoring Secrets Vault APAC
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-375"
  port             = 443
}
