ssh-keygen -q -t rsa -b 4096 -f ~/.ssh/id_rsa -P "" <<<y >/dev/null 2>&1
service ssh restart
