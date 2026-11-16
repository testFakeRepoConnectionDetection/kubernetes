# Network access of the kube-controller deployment (corp landing zone).

# Equity Pricing Engine EMEA
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-671"
  port             = 443
}

module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.treasury-funding-planner-emea"
  port             = 443
}

data "aws_security_group" "peer_03" {
  tags = {
    Application = "Identity File Transfer Hub"
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

# Cards Message Router EMEA
module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-741"
  port             = 443
}

# Calendars Distribution Service
module "egress_05" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-951"
  port             = 443
}
