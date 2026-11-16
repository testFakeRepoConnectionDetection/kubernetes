# Network access of the kube-controller deployment (corp landing zone).

# Retail Accounts Credit Scoring APAC
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-351"
  port             = 443
}

# General Ledger Close Manager EMEA
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-745"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.general-ledger-funding-planner-emea"
  port             = 443
}

data "aws_security_group" "peer_04" {
  tags = {
    app = "kyc-rules-engine-emea"
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

data "aws_security_group" "peer_05" {
  tags = {
    app = "equity-market-data-feed"
  }
}

resource "aws_security_group_rule" "ingress_05" {
  type                     = "ingress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = var.service_sg_id
  source_security_group_id = data.aws_security_group.peer_05.id
}
