# Network access of the kube-controller deployment (corp landing zone).

# Counterparty Risk Stress Testing EMEA
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-146"
  port             = 443
}

# Identity Event Bus EMEA
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-576"
  port             = 443
}

data "aws_security_group" "peer_03" {
  tags = {
    Application = "Equity Derivatives Market Data Feed"
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
