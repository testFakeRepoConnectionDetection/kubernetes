# Network access of the kube-controller deployment (corp landing zone).

module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.app-ap39621"
  port             = 443
}

data "aws_security_group" "peer_02" {
  tags = {
    Application = "Counterparties Data Quality Monitor EMEA"
  }
}

resource "aws_security_group_rule" "ingress_02" {
  type                     = "ingress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = var.service_sg_id
  source_security_group_id = data.aws_security_group.peer_02.id
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ccr-exposure-calculator-emea"
  port             = 443
}

module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.cm-position-keeper-amer"
  port             = 443
}
