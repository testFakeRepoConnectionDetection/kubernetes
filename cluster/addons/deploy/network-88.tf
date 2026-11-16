# Network access of the kube-controller deployment (corp landing zone).

# Accounting Reporting Mart
module "egress_01" {
  source           = "../modules/private-link-consumer"
  endpoint_service = "com.corp.privatelink.ext-gw-485"
  port             = 443
}

data "aws_security_group" "peer_02" {
  tags = {
    app = "integration-log-collector-apac"
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

data "aws_security_group" "peer_03" {
  tags = {
    Application = "Corporate Accounts Repayment Scheduler EMEA"
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
