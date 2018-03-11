[all:vars]
ansible_ssh_common_args='-o ProxyCommand=\"ssh -W %h:%p -q ubuntu@${api_external}\" -o StrictHostKeyChecking=False -o UserKnownHostsFile=/dev/null'
ansible_python_interpreter=/usr/bin/python3
apiserver=${api_internal}
extern_apiserver=${api_external}
[master]
${master}
[worker]
${worker}

