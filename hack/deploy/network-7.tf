# Network access of the kube-controller deployment (corp landing zone).

# Equity Derivatives Quote Publisher AMER
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-871"
  port             = 443
}

# Credit Position Keeper APAC
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-983"
  port             = 443
}

data "aws_security_group" "peer_03" {
  tags = {
    app = "commodities-execution-gateway-emea"
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

# Regulatory Reporting Evidence Archive AMER
module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-994"
  port             = 443
}
