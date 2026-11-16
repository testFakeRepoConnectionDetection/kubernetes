# Network access of the kube-controller deployment (corp landing zone).

# SWIFT Clearing Adapter AMER
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-148"
  port             = 443
}

data "aws_security_group" "peer_02" {
  tags = {
    app = "identity-data-lake-loader-apac"
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

# Treasury Close Manager AMER
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-840"
  port             = 443
}

module "egress_04" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.instant-payments-settlement-engine-apac"
  port             = 443
}

# FX Execution Gateway AMER
module "egress_05" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-669"
  port             = 443
}
