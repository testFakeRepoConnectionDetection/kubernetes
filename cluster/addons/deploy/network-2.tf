# Network access of the kube-controller deployment (corp landing zone).

data "aws_security_group" "peer_01" {
  tags = {
    Application = "SWIFT Statement Generator APAC"
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

module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.integration-directory-service-apac"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.credit-risk-backtesting-amer"
  port             = 443
}

data "aws_security_group" "peer_04" {
  tags = {
    Application = "Corporate Actions Tax Engine AMER"
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

# Corporate Actions Asset Servicing
module "egress_05" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-508"
  port             = 443
}
