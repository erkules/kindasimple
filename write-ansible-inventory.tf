data "template_file" "inventory" {
  template = "${file("${path.module}/templates/ansible_inventory.tpl")}"
  vars {
    api_external="${openstack_networking_floatingip_v2.fip.address}"
    api_internal="${openstack_compute_instance_v2.k8s-master.access_ip_v4}"
    master="${join("\n",openstack_compute_instance_v2.k8s-master.*.access_ip_v4)}"
    worker="${join("\n",openstack_compute_instance_v2.k8s-worker.*.access_ip_v4)}"
  }
}
resource "null_resource" "local" {
  triggers {
    template = "${data.template_file.inventory.rendered}"
  }

  provisioner "local-exec" {
    command = "echo \"${data.template_file.inventory.rendered}\" > ini"
  }
}
