# Network access of the kube-controller deployment (corp landing zone).

# Custody Instruction Manager AMER
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-398"
  port             = 443
}

module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.credit-market-data-feed-emea"
  port             = 443
}

# General Ledger FTP Calculator APAC
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-894"
  port             = 443
}
