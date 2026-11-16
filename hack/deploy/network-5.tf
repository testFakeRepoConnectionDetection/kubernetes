# Network access of the kube-controller deployment (corp landing zone).

# Fund Administration Tax Engine EMEA
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-676"
  port             = 443
}

module "egress_02" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.news-sentiment-api"
  port             = 443
}

module "egress_03" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.commodities-market-data-feed-amer"
  port             = 443
}

data "aws_security_group" "peer_04" {
  tags = {
    app = "operational-risk-limit-monitor-emea"
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

module "egress_05" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.trade-surveillance-case-manager-amer"
  port             = 443
}
