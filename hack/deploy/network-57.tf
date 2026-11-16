# Network access of the kube-controller deployment (corp landing zone).

# Calendars Data Quality Monitor AMER
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-966"
  port             = 443
}

# Credit Execution Gateway APAC
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-379"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.loans-account-ledger-apac"
  port             = 443
}

data "aws_security_group" "peer_04" {
  tags = {
    Application = "Cards Fees Calculator AMER"
  }
}

resource "aws_security_group_rule" "ingress_04" {
  type                     = "ingress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = var.service_sg_id
  source_security_group_id = data.aws_security_group.peer_04.id
}

# Liquidity Risk Stress Testing EMEA
module "egress_05" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-177"
  port             = 443
}
