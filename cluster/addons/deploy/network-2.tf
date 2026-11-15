# Network access of the kube-controller deployment (corp landing zone).

data "aws_security_group" "peer_01" {
  tags = {
    app = "dat-secrets-vault-emea"
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

data "aws_security_group" "peer_02" {
  tags = {
    app = "sep-statement-generator-apac"
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

# Liquidity Risk Collateral Engine
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-572"
  port             = 443
}

# Deposits Customer Onboarding
module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-501"
  port             = 443
}

module "egress_05" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.depbatpro-am"
  port             = 443
}
