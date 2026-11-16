# Network access of the kube-controller deployment (corp landing zone).

# Loans Credit Scoring APAC
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-211"
  port             = 443
}

data "aws_security_group" "peer_02" {
  tags = {
    app = "counterparties-enrichment-service-amer"
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

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.prices-distribution-service-apac"
  port             = 443
}
