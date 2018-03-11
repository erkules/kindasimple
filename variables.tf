### OpenStack Credentials
variable "username" {}

variable "password" {}

variable "domain_name" {}

variable "tenant_name" {
  default = "eu-de"
}

variable "endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

### OTC Specific Settings
variable "external_network" {
  default = "admin_external_net"
}

### Project Settings
variable "project" {
  default = "terraform"
}

variable "subnet_cidr" {
  default = "192.168.10.0/24"
}

variable "ssh_pub_key" {
  default = "~/.ssh/erkan_yanar_linsernaum_rsa.pub"
}

### VM (Instance) Settings
variable "instance_count" {
  default = "1"
}

variable "worker_count" {
  default = "4"
}

variable "flavor_name" {
  default = "s1.medium"
}

variable "image_name" {
  default = "Community_Ubuntu_16.04_TSI_latest"
}

### K8s settings

variable "hyperkubeimage" {
  default = "gcr.io/google-containers/hyperkube:v1.9.3"
}

variable "etcdimage" {
  default = "quay.io/coreos/etcd:v3.2"
}
