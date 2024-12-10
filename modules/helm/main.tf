resource "helm_release" "jpd" {
  chart = var.chart_name
  name  = var.release_name
  repository = var.repository
  namespace = var.namespace

  values = [
    file("${path.root}/values.yaml")
  ]

  wait = false
}

resource "kubernetes_storage_class" "gp2" {
  metadata {
    name = "gp2-csi"
    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }
  storage_provisioner = "ebs.csi.aws.com"
  reclaim_policy      = "Delete"
  parameters = {
    type = "gp2"
    fsType = "ext4"
  }
  volume_binding_mode = "WaitForFirstConsumer"
  allow_volume_expansion = true
}