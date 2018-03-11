#cloud-config
packages:
- ${package}

runcmd:
- systemctl start ${package}
- systemctl enable ${package}
- systemctl start etcd
- systemctl enable etcd


write_files:
- path: /etc/systemd/system/etcd.service
  content: |
    [Unit]
    Description = Etcd Service
    After       = network.target docker.service k8sgencert.service
    [Service]
    ExecStartPre = -/usr/bin/docker rm -f etcd
    ExecStart   =  /usr/bin/docker run  -v etcd:/data/  --rm --net=host -v /etc/kubernetes/ssl:/etc/kubernetes/ssl:ro \
    --name=etcd  "${etcdimage}" etcd  --debug --data-dir /data
    Restart      = always
    RestartSec=10
    [Install]
    WantedBy    = multi-user.target
