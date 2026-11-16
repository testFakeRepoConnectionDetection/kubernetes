# Network access of the kube-controller deployment (corp landing zone).

# Instant Payments Statement Generator
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-795"
  port             = 443
}

# Retail Accounts Balance Service
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-326"
  port             = 443
}

data "aws_security_group" "peer_03" {
  tags = {
    Application = "Rates Pricing Engine AMER"
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

# Legal Entities Enrichment Service AMER
module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-489"
  port             = 443
}

data "aws_security_group" "peer_05" {
  tags = {
    Application = "Messaging File Transfer Hub"
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
