# Network access of the kube-controller deployment (corp landing zone).

# Instant Payments Fees Calculator
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-639"
  port             = 443
}

module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.card-embossing-bureau"
  port             = 443
}

# Integration API Gateway AMER
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-553"
  port             = 443
}

module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.credit-trade-capture-emea"
  port             = 443
}

# Deposits Repayment Scheduler EMEA
module "egress_05" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-197"
  port             = 443
}
