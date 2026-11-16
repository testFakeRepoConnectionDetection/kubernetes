# Network access of the kube-controller deployment (corp landing zone).

# Treasury Close Manager APAC
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-120"
  port             = 443
}

# Prices Data Quality Monitor APAC
module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-434"
  port             = 443
}

# Settlement NAV Calculator AMER
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-419"
  port             = 443
}

data "aws_security_group" "peer_04" {
  tags = {
    app = "liquidity-risk-risk-aggregator"
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

# Corporate Actions Holdings Service AMER
module "egress_05" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-189"
  port             = 443
}
