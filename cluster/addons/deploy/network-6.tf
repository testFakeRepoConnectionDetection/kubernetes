# Network access of the kube-controller deployment (corp landing zone).

module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.equity-derivatives-trade-capture-emea"
  port             = 443
}

# AML Report Builder APAC
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-340"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.market-risk-limit-monitor"
  port             = 443
}

data "aws_security_group" "peer_04" {
  tags = {
    Application = "AML Transaction Monitor EMEA"
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
