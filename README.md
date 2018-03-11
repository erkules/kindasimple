# kindasimple

kindasimple is just a little project for me to deploy a k8s test cluster on otc.  Basically it deploys a Kubernetes Cluster with one master running on an Ubuntu OS.

It is basically a braindump. So feel free to take what you need. There are also a lot of artefacts as I tried to do all the stuff without ansible the first time by utilising cloud-init. But it didn't worked out :)



I took a lot from https://github.com/OpenTelekomCloud/terraform-otc myself.


# Minimal Terraform OTC Example (from the github repo above)

This script will create the following resources:

* Floating IPs
* Neutron Ports
* Instances
* Keypair
* Network
* Subnet
* Router
* Router Interface
* Security Group (Allow ICMP, 80/tcp, 22/tcp)


# What it does:

At first it creates an infrastructure using terraform.
Terraform also writes an inventory file for ansible.  
The variables regarding the infrastructure/terraform  are found in `variables.tf`.

Don't touch `instances` as it would start multiple masters. Right now 
only one master is supported. Also the communication is kinda mess, as it is not encrypted (but locally).

At least you should change `ssh_pub_key`. As for sure it is the wrong key in it ;)

`worker_count` and `flavor_name` are the one you would like to set.

Also cp `parameter.tvars.vorlage` to `parameter.tvars` and put your OTC credentials in it.

For ansilbe there is the file `group_vars/all` Basically you can ignore it. Right now K8s 1.9.3 is installed. Feel free to change it.

# Deploying

~~~
terraform init
terraform apply -var-file parameter.tvars
ansible-playbook -i ini play.yml
~~~

After that check for the clusterfiles/cluster-admin/ directory. 
There is the kubeconfig and all the certs you need to access the cluster.

Use that credentials to apply all the ressources in the deployfiles directory.

And now you are done.

parameter.tvars.vorlage
