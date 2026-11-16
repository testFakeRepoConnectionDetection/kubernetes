# Network access of the kube-controller deployment (corp landing zone).

# Cost Allocation FTP Calculator AMER
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-389"
  port             = 443
}

module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.credit-risk-var-engine-amer"
  port             = 443
}

data "aws_security_group" "peer_03" {
  tags = {
    Application = "Cash Management Clearing Adapter APAC"
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

data "aws_security_group" "peer_04" {
  tags = {
    app = "swift-fees-calculator-emea"
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
