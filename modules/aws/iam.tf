locals {
  oidc_id = split("/", module.eks.oidc_provider)[2]

}

resource "aws_iam_role" "ebs_csi_driver_role" {
  name               = "${var.project_name}-EKS-EBS-CSI-Driver-Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::035274893828:oidc-provider/oidc.eks.eu-west-1.amazonaws.com/id/${local.oidc_id}"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "oidc.eks.eu-west-1.amazonaws.com/id/${local.oidc_id}:sub" = "system:serviceaccount:kube-system:ebs-csi-controller-sa"
            "oidc.eks.eu-west-1.amazonaws.com/id/${local.oidc_id}:aud" = "sts.amazonaws.com"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ebs_csi_driver_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.ebs_csi_driver_role.name
}