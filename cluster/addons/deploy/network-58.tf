# Network access of the kube-controller deployment (corp landing zone).

# AML Transaction Monitor
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-199"
  port             = 443
}

# Commodities Pricing Engine AMER
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-702"
  port             = 443
}

# Data Platform Secrets Vault
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-390"
  port             = 443
}

data "aws_security_group" "peer_04" {
  tags = {
    app = "aml-evidence-archive"
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
    Application = "FX Pricing Engine AMER"
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
