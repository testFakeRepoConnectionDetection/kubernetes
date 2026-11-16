# Network access of the kube-controller deployment (corp landing zone).

data "aws_security_group" "peer_01" {
  tags = {
    app = "instruments-golden-source-emea"
  }
}

resource "aws_security_group_rule" "ingress_01" {
  type                     = "ingress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = var.service_sg_id
  source_security_group_id = data.aws_security_group.peer_01.id
}

# General Ledger Consolidation AMER
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-685"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.loyalty-points-engine"
  port             = 443
}
