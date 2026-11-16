# Network access of the kube-controller deployment (corp landing zone).

data "aws_security_group" "peer_01" {
  tags = {
    Application = "Mortgages Balance Service EMEA"
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
    Application = "Prices Mapping Service APAC"
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

# Corporate Accounts Balance Service APAC
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-145"
  port             = 443
}
