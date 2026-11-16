# Network access of the kube-controller deployment (corp landing zone).

# Instant Payments Clearing Adapter APAC
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-895"
  port             = 443
}

# General Ledger Reporting Mart
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-589"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.swift-clearing-adapter"
  port             = 443
}

module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.fx-execution-gateway-apac"
  port             = 443
}

# Data Platform Event Bus APAC
module "egress_05" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-465"
  port             = 443
}
