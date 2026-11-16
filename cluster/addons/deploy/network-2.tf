# Network access of the kube-controller deployment (corp landing zone).

# Operational Risk Sensitivities Service AMER
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-998"
  port             = 443
}

data "aws_security_group" "peer_02" {
  tags = {
    Application = "Cash Management Clearing Adapter APAC"
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

data "aws_security_group" "peer_03" {
  tags = {
    app = "market-risk-stress-testing-amer"
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
