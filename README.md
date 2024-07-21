## DAB Appliances Build Files

### [SSH on Debian Buster and later](https://forum.proxmox.com/threads/lxc-template-from-backup-issues.151501/) and newer Ubuntu templates
* SSH keys generally need to generated after the template creates a new container
```bash
ssh-keygen -q -t rsa -b 4096 -f ~/.ssh/id_rsa -P "" <<<y >/dev/null 2>&1
# If not done and needed:
# sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
service ssh restart
```

