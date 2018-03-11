data "template_file" "k8s" {
  template = "${file("${path.module}/templates/cloudinit.tpl")}"

  vars {
    package = "docker.io"
    etcdimage = "${var.etcdimage}"
    hyperkubeimage = "${var.hyperkubeimage}"
  }
}

data "template_file" "worker" {
  template = "${file("${path.module}/templates/cloudinitworker.tpl")}"

  vars {
    package = "docker.io"
    hyperkubeimage = "${var.hyperkubeimage}"
  }
}
