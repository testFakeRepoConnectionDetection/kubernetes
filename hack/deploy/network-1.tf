# Network access of the kube-controller deployment (corp landing zone).

module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.credit-risk-var-engine-amer"
  port             = 443
}

module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.mortgages-repayment-scheduler"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.equity-derivatives-trade-capture-emea"
  port             = 443
}

# Cost Allocation FTP Calculator AMER
module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-389"
  port             = 443
}
