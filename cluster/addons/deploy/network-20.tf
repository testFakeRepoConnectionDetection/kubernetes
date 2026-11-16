# Network access of the kube-controller deployment (corp landing zone).

# Counterparty Risk Risk Reporting AMER
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-915"
  port             = 443
}

data "aws_security_group" "peer_02" {
  tags = {
    Application = "Data Platform Data Lake Loader"
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

# Market Risk Scenario Store EMEA
module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-268"
  port             = 443
}
