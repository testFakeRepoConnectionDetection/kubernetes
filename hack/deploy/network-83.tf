# Network access of the kube-controller deployment (corp landing zone).

# Messaging Data Lake Loader
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-692"
  port             = 443
}

module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.liquidity-risk-risk-aggregator"
  port             = 443
}

data "aws_security_group" "peer_03" {
  tags = {
    Application = "Cards Reconciliation"
  }
}

resource "aws_security_group_rule" "ingress_03" {
  type                     = "ingress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = var.service_sg_id
  source_security_group_id = data.aws_security_group.peer_03.id
}

# Custody Event Processor
module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-404"
  port             = 443
}
